import { combineReducers } from 'redux';
import counter from '../components/counter.reducer';

const rootReducer = combineReducers({
  counter,
});

export type RootState = ReturnType<typeof rootReducer>;

export default rootReducer;
