function getComponent(el, throwOnError = false) {
  try {
    return Alpine.$data(el);
  } catch (error) {
    if (throwOnError) {
      throw error;
    } else {
      return null;
    }
  }
}

function getData(el) {
  const root = Alpine.closestRoot(el);
  return root ? Alpine.$data(root) : null;
}

function setData(el, newData) {
  const data = getData(el);
  return data ? Object.assign(data, newData) : null;
}

function registerComponents(entries) {
  for (const key in entries) {
    const entry = entries[key];
    if (entry.__esModule === true && "default" in entry) {
      Alpine.data(entry.default.name, entry.default);
    } else {
      registerComponents(entry);
    }
  }
}

export { getComponent, getData, setData, registerComponents };
