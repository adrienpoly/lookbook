import { getData } from "@helpers/alpine";
import { nameFunction } from "@helpers/lang";

export default function Component(name, fn) {
  const func = nameFunction(name, (...args) => {
    const data = fn(...args);

    Object.defineProperties(data, {
      $parent: {
        get() {
          return getData(this.$root.parentElement);
        },
      },
    });

    data.$options = {};

    return data;
  });

  func.component = true;
  return func;
}
