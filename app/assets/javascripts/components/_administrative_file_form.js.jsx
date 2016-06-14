var AdministrativeFileRow = React.createClass({
  handleRemove() {
    this.props.handleRemove(this.props.id)
  },
  render() {
    return(
      <tr key={this.props.id}>
        <td> {this.props.nro_exp} </td>
        <td> {this.props.letra} </td>
        <td> {this.props.nro_fojas} </td>
        <td> {this.props.year} </td>
        <td>
          <i className='fa fa-remove btn btn-xs' onClick={this.handleRemove}></i>
        </td>
      </tr>
    )
  }
});

var AdministrativeFileForm = React.createClass({
  getInitialState() {
    return { rows: [] }
  },
  componentWillMount() {
    if (this.props.id > 0) {
      var that = this
      $.ajax({
        url: '/administrative_files',
        type: 'GET',
        data: {
          id: this.props.id,
          type: this.props.type
        },
        success: (response) => {
          console.log(response);
          var adminFiles = that.state.rows;
          response.map((elem) => {
            var id = that.state.rows.length;
            adminFiles.push(
              <AdministrativeFileRow
                key={id}
                nro_exp={elem.nro_exp}
                letra={elem.letra}
                nro_fojas={elem.nro_fojas}
                year={elem.year}
                handleRemove={that.handleRemove}/>);
            this.setState({ rows: adminFiles });
          });
       }
    })}
  },
  handleRemove(key) {
    var newState = this.state.rows
    newState.splice(key, 1) // Remove an element from rows array
    this.setState({ rows: newState })
  },
  handleClick(e) {
    e.preventDefault();
    var newState = this.state.rows
    var id = this.state.rows.length
    newState.push(
      <AdministrativeFileRow
        key={id}
        nro_exp={this.refs.nro_exp.value}
        letra={this.refs.letra.value}
        nro_fojas={this.refs.nro_fojas.value}
        year={this.refs.year.value}
        handleRemove={this.handleRemove}/>
    )
    this.setState({ rows: newState })
    $(this.props.form)[0].reset()
  },
  showRows() {
    return this.state.rows
  },
  render() {
    return (
      <div>
        <form id='new-administrative-file' className='input-group'>
          <div className='input-group' type='submit'>
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
            Cargar exp. administrativo
          </button>
        </form>
        <hr/>
        <table className='table table-striped table-bordered'>
          <thead>
            <tr>
              <th className='center'>Nro. Expediente</th>
              <th className='center'>Letra</th>
              <th className='center'>Nro. fojas</th>
              <th className='center'>Año</th>
              <th className='center' width='1%'> <i className='fa fa-trash'> </i> </th>
            </tr>
          </thead>
          <tbody>
            {this.showRows()}
          </tbody>
          <tfoot>
            <tr>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
          </tfoot>
        </table>

      </div>
    )
  }
});
