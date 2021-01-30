import React from 'react';
import axios from 'axios';
import { connect } from 'react-redux';
import { SET_IS_LOGIN } from '../redux/actions/LoginActions';

const Messenger = ({ dispatch, isLogin }) => {
    React.useEffect(() => {
        axios.get('/users/verify', { withCredentials: true })
            .then((res) => {
                console.log(res);
            })
            .catch(() => {
                window.location = '/';
            });
    }, [dispatch]);

    const [users, setUsers] = React.useState([]);
 
    const logOut = () => {
        axios.post('/users/logout')
            .then(() => {
                window.location = '/';
            })
            .catch((e) => {
                console.log(e);
            });
    }

 

    let mainComponent =
        <div className="main">
            <div className="side-bar">
                {/* {groups.map((group, i) =>
                    (inGroup(group.members)) ? (
                        <div key={i}>
                            <button onClick={() => groupChange(group)}>
                                {group.members.map((member, i) => 
                                    (member[0] !== Cookies.get('username')) && (
                                        member[1]
                                    )
                                )}
                                <br />
                            </button>
                        </div>
                    ) : (
                        <div key={i}></div>
                    )
                )} */}
            </div>
            <div className="chat-area">
                {/* {messages.map((message, i) =>
                    ((message.group === currentGroup._id) && (message.author === Cookies.get('firstName') + ' ' + Cookies.get('lastName'))) ? (
                        <div key={i} className="message right">
                            <p>{message.author}</p>
                            <div className="message-container">
                                <div className="your-message">
                                    {message.message}
                                </div>
                            </div>
                        </div>
                    ) : (
                        ((message.group === currentGroup._id) && (message.author !== Cookies.get('firstName') + ' ' + Cookies.get('lastName'))) && (
                            <div key={i} className="message">
                                <p>{message.author}</p>
                                <div className="message-container">
                                    <div className="other-message">
                                        {message.message}
                                    </div>
                                </div>
                            </div>
                        ) 
                    ) */}
                )}
                <div className="message-field">
                    <input
                        placeholder="Send Message..."
                    />
                    <button>Send</button>
                </div>
            </div>
        </div>

    return (
        <div className="messenger">
            <nav>
                <input
                    placeholder="Search User..."
                />
                <button>Log Out</button>
            </nav>
        </div >
    );
};

const mapStateToProps = state => ({
    isLogin: state.isLogged.isLogin,
});

export default connect(mapStateToProps)(Messenger);