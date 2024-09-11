/*
	Vista para la grilla de trabajadores
	Contara con Botones Nuevo, Modificar y Eliminar y sus respectivos iconos
	ademas de las columnas  para el id, codigo, nombre, ap. paterno, ap materno, estado
*/
Ext.define('ExtMVC.view.Trabajador.Grid' ,{
    extend: 'Ext.grid.Panel',
    alias : 'widget.TrabajadorGrid',    
    iconCls: 'icon-grid',
    title : 'Lista de Trabajadores',
	frame: true,
    store: 'Trabajadores',

    columns: [{
    	header: "ID",
		width: 170,
		flex:1,
		dataIndex: 'tra_ide',
        hidden: true
	},{
    	header: "CODIGO",
		width: 170,
		flex:1,
		dataIndex: 'tra_cod'
	},{
		header: "NOMBRE",
		width: 160,
		flex:1,
		dataIndex: 'tra_nom'
	},{
		header: "AP. PATERNO",
		width: 170,
		flex:1,
		dataIndex: 'tra_pat'
	},{
		header: "AP. MATERNO",
		width: 170,
		flex:1,
		dataIndex: 'tra_mat'
	},{
		header: "ESTADO",
		width: 170,
		flex:1,
		dataIndex: 'est_ado',
		renderer: function(value) { return value === '1' ? 'Eliminado' : 'Activo'; }
	}],
	
	initComponent: function() {
		this.dockedItems = [{
            xtype: 'toolbar',
            items: [{
                iconCls: 'icon-user',
                itemId: 'add',
                text: 'Nuevo',
                action: 'add'
            },{
                iconCls: 'icon-edit',
                text: 'Modificar',
                action: 'edit'
            },{
                iconCls: 'icon-delete',
                text: 'Eliminar',
                action: 'delete'
            }]
        }];		
		this.callParent(arguments);
	}
});