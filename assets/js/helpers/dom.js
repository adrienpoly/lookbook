import { isNumber } from "lodash";

function getHiddenElementDimensions(el, display = "block") {
  let size;
  if (el.style.display === "none") {
    el.style.display = display;
    size = el.getBoundingClientRect();
    el.style.display = "none";
  } else {
    size = el.getBoundingClientRect();
  }

  return size;
}

function castAttributeValue(value) {
  if (value === "false") {
    return false;
  }

  if (value === "true") {
    return true;
  }

  if (isNumber(value)) {
    return parseInt(value, 10);
  }

  return value;
}

function isNode(o) {
  return typeof Node === "object"
    ? o instanceof Node
    : o &&
        typeof o === "object" &&
        typeof o.nodeType === "number" &&
        typeof o.nodeName === "string";
}

export { getHiddenElementDimensions, castAttributeValue, isNode };
