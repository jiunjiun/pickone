var EventItems = React.createClass({
  getInitialState: function() {
    return {items: this.props.items};
  },

  handleAddDealer: function( e ) {
    e.preventDefault();
    this.state.items.push({})
    this.setState({items: this.state.items});
  },

  handleDeleteDealer: function( index ) {
    var items = this.state.items;
    items.splice(index, 1);
    this.setState({items: items});
  },

  validation: function() {

  },

  render: function() {
    var item = this.state.items.map(function(item, index) {
      return <EventItem key={index} index={index} onDelete={this.handleDeleteDealer} item={item} />
    }.bind(this));

    return (
      <div className="panel colourable">
        <div className="panel-heading">
          <span className="panel-title">{ I18n.t('simple_form.labels.event.item') }</span>
          <div className="panel-heading-controls">
            <button className="btn btn-xs btn-success" onClick={this.handleAddDealer}>{ I18n.t('helpers.add') }</button>
          </div>
        </div>
        {this.validation()}
        <div className="panel-body">
          {item}
        </div>
      </div>
    );
  }
});
