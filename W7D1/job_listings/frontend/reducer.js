const initialState = {
  city: "Please Select", 
  jobs: []
};

const reducer = (state = initialState, action) => {
  switch(action.type) {
    case "SWITCH_LOCATION": 
      const newState = {
        city: action.city,
        jobs: action.jobs
      };
      return newState;
    default: 
      return state;
  }
};
// window.reducer = reducer;
export default reducer;
