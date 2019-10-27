import { Provider } from 'react-redux';
import * as React from 'react';
import { Store } from 'redux';
import { MemoryHistory } from 'history';

import Counter from './components/Counter';

type AppProps = {
  store: Store,
  history: MemoryHistory,
};

class App extends React.Component<AppProps> {
  componentWillMount() {
    console.log('App', 'componentWillMount');
  }

  componentDidMount() {
    console.log('App', 'componentDidMount');
  }

  componentWillUnmount() {
    console.log('App', 'componentWillUnmount');
  }

  render() {
    return (
      <Provider store={this.props.store}>
        <Counter />
      </Provider>
    );
  }
}

export default App;
