import { combineReducers } from "redux";
import Logged from "../reducers/isLogged";

const rootReducer = combineReducers({
    isLogged : Logged,
});

export default rootReducer;