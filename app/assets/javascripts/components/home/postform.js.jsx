

// app/assets/javascripts/components/_post_form.jsx
class PostForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: props.skill.name,
      price: props.skill.price,
      description: props.skill.description,
      location: props.skill.location,
      availability: props.skill.availability,
      category: props.skill.category
    };
    this.handleNameChange = this.handleNameChange.bind(this);
    this.handlePriceChange = this.handlePriceChange.bind(this);
    this.handleDescriptionChange = this.handleDescriptionChange.bind(this);
    this.handleLocationChange = this.handleLocationChange.bind(this);
    this.handleAvailabilityChange = this.handleAvailabilityChange.bind(this);
    this.handleCategoryChange = this.handleCategoryChange.bind(this);
  }

  handleNameChange(e) {
    this.setState({name: e.target.value});
  }

  handlePriceChange(e) {
    this.setState({price: e.target.value});
  }

  handleDescriptionChange(e) {
    this.setState({description: e.target.value});
  }

  handleLocationChange(e) {
    this.setState({location:e.target.value});
  }

  handleAvailabilityChange(e) {
    this.setState({availability: e.target.value});
  }

  handleCategoryChange(e) {
    this.setState({category: e.target.value});
  }

  render() {
    return (
  <div className="new-skill-form-inputs">
        <label>Name</label>
        <input
          type="text"
          name="skill[name]"
          value={this.state.name}
          onChange={this.handleNameChange}
        />

        <label>Price</label>
        <input
          className="new-skill-form-inputs"
          type="text"
          name="skill[price]"
          value={this.state.price}
          onChange={this.handlePriceChange}
        />

        <label>Description</label>
        <input
          type="text"
          name="skill[description]"
          value={this.state.description}
          onChange={this.handleDescriptionChange}
        />


        <label>Location</label>
        <input
          type="text"
          name="skill[location]"
          value={this.state.location}
          onChange={this.handleLocationChange}
        />


        <label>Availability</label>
        <input
          type="text"
          name="skill[availability]"
          value={this.state.availability}
          onChange={this.handleAvailabilityChange}
        />


        <label>category</label>
        <input
          type="text"
          name="skill[category]"
          value={this.state.category}
          onChange={this.handleCategoryChange}
        />

        <input type="submit" value="create skill" />
      </div>
    );
  }
}
