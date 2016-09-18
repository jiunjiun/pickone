var EventItems = React.createClass({
  getInitialState: function() {
    return {items: this.props.items};
  },

  handleAdd: function( e ) {
    e.preventDefault();
    this.state.items.push({key: Math.random()})
    this.setState({items: this.state.items});
  },

  handleDelete: function( index ) {
    this.state.items.splice(index, 1);
    this.replaceState({items: this.state.items});
  },

  validation: function() {
  },

  render: function() {
    var item = this.state.items.map(function(item, index) {
      var key = item.id ? item.id : item.key;
      return <EventItem key={key} index={index} onDelete={this.handleDelete} item={item} />
    }.bind(this));

    return (
      <div className="panel colourable">
        <div className="panel-heading">
          <span className="panel-title">{ I18n.t('simple_form.labels.event.item') }</span>
          <div className="panel-heading-controls">
            <button className="btn btn-xs btn-success" onClick={this.handleAdd}>{ I18n.t('helpers.add') }</button>
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
