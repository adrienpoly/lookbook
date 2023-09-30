function nameFunction(name, body) {
  return {
    [name](...args) {
      return body.apply(this, args);
    },
  }[name];
}

export { nameFunction };
