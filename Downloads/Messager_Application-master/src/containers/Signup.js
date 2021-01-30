import React from "react";
import axios from 'axios';
import md5 from 'md5';
import {Form, Button} from "react-bootstrap";
import "./Signup.css";

export default function Signup() {
    const [firstName, setFirstName] = React.useState('');
    const [lastName, setLastName] = React.useState('');
    const [email, setEmail] = React.useState('');
    const [username, setUsername] = React.useState('');
    const [password, setPassword] = React.useState('');

    function handleSubmit(event) {
        event.preventDefault();
        const user = {
            username,
            firstName,
            lastName,
            email,
            password: md5(password),
        };

        axios.post('/users/signup', user)
            .then((res) => {
                console.log(res.data.result);
                if(res.data.result === false){
                    window.location = '/signup';
                }else{
                    window.location = '/login';
                }
            })
            .catch(console.log);
    }

    return (
        <div className="Signup">
            <Form onSubmit={handleSubmit}>
                <Form.Group controlId="username" size="lg">
                    <Form.Label>User Name</Form.Label>
                    <Form.Control
                        type="text"
                        value={username}
                        onChange={e => setUsername(e.target.value)}
                    />
                </Form.Group>
                <Form.Group  size="lg" controlId="firstName">
                    <Form.Label>First Name</Form.Label>
                    <Form.Control
                        autoFocus
                        type="text"
                        value={firstName}
                        onChange={e => setFirstName(e.target.value)}
                    />
                </Form.Group>
                <Form.Group controlId="lastName" size="lg">
                    <Form.Label>Last Name</Form.Label>
                    <Form.Control
                        type="text"
                        value={lastName}
                        onChange={e => setLastName(e.target.value)}
                    />
                </Form.Group>
                <Form.Group controlId="email" size="lg">
                    <Form.Label>Email</Form.Label>
                    <Form.Control
                        type="email"
                        value={email}
                        onChange={e => setEmail(e.target.value)}
                    />
                </Form.Group>
                <Form.Group controlId="password" size="lg">
                    <Form.Label>Password</Form.Label>
                    <Form.Control
                        type="password"
                        value={password}
                        onChange={e => setPassword(e.target.value)}
                    />
                </Form.Group>
                <Button block size="lg" type="submit">
                    Signup
                </Button>
            </Form>
        </div>
    );
}

