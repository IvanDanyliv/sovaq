import React from 'react'

class QuizForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            name: props.post.name,

        };
        this.handleNameChange = this.handleNameChange.bind(this);

    }

    handleNameChange(e) {
        this.setState({ name: e.target.value });
    }

    render() {
        return (
            <div>
                <label>Name</label>
                <input
                    type="text"
                    name="quiz[name]"
                    value={this.state.name}
                    onChange={this.handleNameChange}
                />
                <input type="submit" value="Update Quiz" />
            </div>
        );
    }
}

export default QuizForm