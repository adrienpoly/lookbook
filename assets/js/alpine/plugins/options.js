import { kebabCase, camelCase, mapValues, keyBy } from "lodash";
import { castAttributeValue } from "@helpers/dom";
import { setData } from "@helpers/alpine";

export default function (Alpine) {
  Alpine.directive(
    "options",
    (el, { expression }, { evaluate, effect, cleanup }) => {
      // Extract the names of options to bind to from the directive
      // expression: `x-options="['option-name', 'another-option']"`
      const optionNames = evaluate(expression);

      const optionsData = buildOptionsData(el, optionNames);
      const optionAttrs = optionsData.map((option) => option.attr);

      // Add `.$options` property to provide the component
      // with access to the (live, reactive) options values.

      const data = setData(
        el,
        Alpine.reactive({
          $options: toPairs(optionsData),
        })
      );

      // Ensure data-attribute values are kept in sync with `$options`
      // property values:

      effect(() => {
        Object.entries(data.$options).forEach(([key, value]) => {
          Alpine.mutateDom(() => {
            const attrName = `data-${kebabCase(key)}`;
            if (value === null) {
              el.removeAttribute(attrName);
            } else {
              el.setAttribute(attrName, value);
            }
          });
        });
      });

      // Create an attribute observer to watch for external changes to
      // component attributes and to update the options data object accordingly.

      const attrObserver = new MutationObserver((mutationsList) => {
        for (const mutation of mutationsList) {
          const attrName = mutation.attributeName;

          if (
            mutation.type !== "attributes" ||
            !optionAttrs.includes(attrName)
          ) {
            return;
          }

          const value = mutation.target.getAttribute(attrName);
          const option = camelCase(attrName.replace("data-", ""));

          data.$options[option] = castAttributeValue(value);
        }
      }).observe(el, { attributes: true });

      // Cleanup when we are done...

      cleanup(() => {
        attrObserver && attrObserver.disconnect();
      });
    }
  ).before("bind");
}

// Build an array of objects with normalized
// attribute names, component keys and the initial value
// of the option (if the data-attribute is present).
function buildOptionsData(el, optionNames) {
  return optionNames.map((name) => {
    const key = camelCase(name);
    const attr = `data-${kebabCase(name)}`;

    // Values are crudely type-cast into booleans, integers
    // and strings. Good enough to cover the majority of use cases.
    let value = null;
    if (el.hasAttribute(attr)) {
      const strValue = el.getAttribute(attr);
      value = castAttributeValue(strValue);
    }

    return { name, key, attr, value };
  });
}

function toPairs(optionsData) {
  return mapValues(keyBy(optionsData, "key"), "value");
}
