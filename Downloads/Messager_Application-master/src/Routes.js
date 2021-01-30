import React from "react";
import {Route, Switch} from "react-router-dom";
import NotFound from "./containers/NotFound";
import Home from "./containers/Home";
import Login from "./containers/Login";
import Signup from "./containers/Signup";
import Messenger from "./containers/Messenger";

export default function Routes() {
    return (
        <Switch>
            <Route exact path="/">
                <Home />
            </Route>
            <Route exact path="/login">
                <Login />
            </Route>
            <Route exact path="/signup">
                <Signup />
            </Route>
            <Route exact path="/messenger">
                <Messenger />
            </Route>
            <Route>
                <NotFound />
            </Route>
        </Switch>
    );
}