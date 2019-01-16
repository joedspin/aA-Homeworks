import React from 'react';
import { Provider } from 'react-redux';
import { fetchSearchGiphys } from '../util/api_util';
import { receiveSearchGiphys } from '../actions/giphy_actions';
import GiphysSearchContainer from './giphys_search_container';


// window.store = store;
// window.fetchSearchGiphys = fetchSearchGiphys;
// window.receiveSearchGiphys = receiveSearchGiphys;

const Root = ({ store }) => (
  <>
    <Provider store={store}>
      <GiphysSearchContainer />
    </Provider>
  </>
);

export default Root;