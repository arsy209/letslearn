class LearnMore extends React.Component {
  render() {
    return(
      <div className="wrapper-green">
        <div className="container">
          <div className="row text-center">
            <h2 className="text-center feature-heading">How Does Lets-Learn Work?</h2>
            <div className="col-sm-12 col-lg-4">
              <div className="feature-content">
                <p className="feature-title">Search</p>

              <img src="/search.png" className="feature-icon" alt="searching"/>
                <p className="image-label">Find Local Tutors/Teachers in your Community</p>
              </div>
            </div>
            <div className="col-sm-12 col-lg-4">
              <div className="feature-content">
                <p className="feature-title">Match</p>
                <img src="/neighbours.png" className="feature-icon" alt="match"/>
                <p className="image-label">View each profile to find your perfect match.</p>
              </div>
            </div>
            <div className="col-sm-12 col-lg-4">
              <div className="feature-content">
                <p className="feature-title">Meet</p>
                <img src="/message.png" className="feature-icon" alt="meet"/>
                <p className="image-label">Message and meet in person to Learn.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}
