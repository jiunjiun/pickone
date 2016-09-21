var EventItem = React.createClass({
  componentDidMount: function() {
  },

  handleDelete: function( e ) {
    e.preventDefault();
    this.props.onDelete(this.props.index);
  },

  render: function() {
    var item_id         = this.props.item.id;
    var item_name       = this.props.item.name;
    var item_link       = this.props.item.link;
    var input_hidden    = 'event[items_attributes]['+ this.props.index +'][id]';
    var item_field_name = 'event[items_attributes]['+ this.props.index +'][name]';
    var item_field_link = 'event[items_attributes]['+ this.props.index +'][link]';

    return (
      <tr>
        <td className="center">
          <button className="btn btn-xs btn-danger btn-delete" onClick={this.handleDelete}>{ I18n.t('helpers.delete') }</button>
        </td>
        <td>
          <input type="text" name={item_field_name} className="form-control form-group-margin" defaultValue={item_name} placeholder={I18n.t('simple_form.placeholders.event.items.name')} />
        </td>
        <td>
          <input type="url" name={item_field_link} className="form-control form-group-margin" defaultValue={item_link} placeholder={I18n.t('simple_form.placeholders.event.items.link')} />
        </td>
      </tr>
    );
  }
});
