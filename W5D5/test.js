const testTime = (string) => {
  for (let index = 0; index < string.length; index++) {
    const element = string[index];
    debugger;
  }
};
// testTime('apple')



function hammerTime(time) {
  window.setTimeout(function () {
    alert(`${time} is hammertime`);
  }, time);
}

hammerTime(5000);