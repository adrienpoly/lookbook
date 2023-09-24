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

export { getComponent, getData, setData };
