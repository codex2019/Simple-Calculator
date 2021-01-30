const INITIAL_STATE = {
    isLoading: false,
}

const isLogin = (state = INITIAL_STATE, action) => {
    switch(action.type){
        case 'SET_IS_LOGIN':
            return {
                ...state,
                isLogin: action.isLogin,
            }
        default:
            return state;
    }
}