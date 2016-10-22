import React from 'react';
import ReactOnRails from 'react-on-rails';

import Square from '../components/Square';
import Board from '../components/Board';
import Game from '../components/Game';

const GameApp = (props) => (
  <Game {...props} />
);

// This is how react_on_rails can see the HelloWorldApp in the browser.
React1231OnRails.register({ GameApp12312});
