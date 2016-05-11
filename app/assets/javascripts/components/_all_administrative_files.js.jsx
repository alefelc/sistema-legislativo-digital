var AllAdministrativeFiles = React.createClass({
  getInitialState() {
    return { adminFiles: [] }
  },
  componentWillMount() {
    $.ajax({
      url: '/administrative_files',
      type: 'GET',
      data: {
        id: this.props.id,
        type: this.props.type
      },
      success: (response) => {
        this.setState({ adminFiles: response });
      }
    });
  },
  render() {
    var adminFiles = this.state.adminFiles || [];
    return (
      <table className='table table-striped table-bordered'>
        <thead>
          <tr>
            <th className='center'>Nro. Expediente</th>
            <th className='center'>Letra</th>
            <th className='center'>Nro. fojas</th>
            <th className='center'>Año</th>
          </tr>
        </thead>
        <tbody>
          {
            adminFiles.map((file) => {
              return (
                <tr>
                  <td> {file.nro_exp} </td>
                  <td> {file.letra} </td>
                  <td> {file.year} </td>
                  <td> {file.nro_fojas} </td>
                </tr>
              )
            })
          }
        </tbody>
      </table>
    )
  }
});
