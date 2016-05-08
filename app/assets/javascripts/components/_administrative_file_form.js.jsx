var AdministrativeFileForm = React.createClass({
  handleClick(adminFile) {
    adminFile.preventDefault();
    $.ajax({
      url: '/administrative_files',
      type: 'POST',
      data: {
        id: this.props.id,
        type: this.props.type,
        administrative_file: {
          nro_exp: this.refs.nro_exp.value,
          letra: this.refs.letra.value,
          year: this.refs.year.value,
          nro_fojas: this.refs.nro_fojas.value
        }
      },
      success: (adminFile) => {
        $(this.props.form)[0].reset()
        $(this.props.table).append(
          "<tr><td>" + adminFile.nro_exp + "</td>" +
          "<td>" + adminFile.letra + "</td>" +
          "<td>" + adminFile.nro_fojas + "</td>" +
          "<td>" + adminFile.year + "</td></tr>")
      }
    });
  },
  render() {
    return (
      <form id='new-administrative-file'>
        <div className='input-group'>
          <label className='input-group-addon'> Nro. exp. </label>
          <input className='form-control' ref='nro_exp' type='number' step='1' min='1' />

          <label className='input-group-addon' for='letra'> Letra </label>
          <input className='form-control' ref='letra' />

          <label className='input-group-addon' for='year'> Año </label>
          <input className='form-control' ref='year' type='number' step='1' min='1900' />

          <label className='input-group-addon' for='nro_fojas'> Cant. fojas </label>
          <input className='form-control' ref='nro_fojas' type='number' step='1' min='0' />
        </div>
        <button onClick={this.handleClick} className='pull-right btn btn-default admin-file-button'>
          Asociar exp. administrativo
        </button>
      </form>
    )
  }
});
