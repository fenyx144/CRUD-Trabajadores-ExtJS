/*
    Controller principal para el funcionamiento de la pagina
    Se define eñ funcionamiento de los botones y el funcionamiento  de lformulario
*/

Ext.define('ExtMVC.controller.Trabajadores', {
    extend: 'Ext.app.Controller',
    stores: ['Trabajadores'],
    models: ['Trabajador'],
    views: ['Trabajador.Formulario', 'Trabajador.Grid'],
    refs: [{
            ref: 'TrabajadorPanel',
            selector: 'panel'
        },{
            ref: 'TrabajadorGrid',
            selector: 'TrabajadorGrid'
        }
    ],
    //Indicamos los eventos
    init: function() {
        this.control({
            'TrabajadorGrid dataview': {
                itemdblclick: this.editarTrabajadorClick
            },
            'TrabajadorGrid button[action=add]': {
                click: this.addTrabajador
            },
            'TrabajadorGrid button[action=edit]': {
                click: this.editarTrabajadorButon
            },
            'TrabajadorGrid button[action=delete]': {
                click: this.deleteTrabajador
            },
            'Trabajadorform button[action=save]': {
                click: this.saveTrabajador
            }
        });
    },
    // Función para editar con doble click un trabajador
    editarTrabajadorClick: function(grid, record) {
        if(record) {
            var edit = Ext.create('ExtMVC.view.Trabajador.Formulario');
            edit.down('form').loadRecord(record);
        }
    },
     // Función que se ejecuta cuando se hace clic en el botón 'Nuevo'
    addTrabajador: function(button) {
        Ext.create('ExtMVC.view.Trabajador.Formulario');
    },
    // Función que se ejecuta al hacer clic en el botón 'Editar'
    editarTrabajadorButon: function(button) {
        var grid = this.getTrabajadorGrid(), 
        selectionModel = grid.getSelectionModel(),
        record = selectionModel.getSelection()[0];

        //se verifica si ha sido seleccionado un trabajador para cargarlo en el formulario
        if (record != null) {
            var edit = Ext.create('ExtMVC.view.Trabajador.Formulario');
            edit.down('form').loadRecord(record);
        } else {
            Ext.Msg.alert('Advertencia', 'Seleccione un trabajador para modificar.');
        }
    },
    // Función que guarda los datos del trabajador (nuevo o editado)
    saveTrabajador: function(button) {
        var win    = button.up('window'),
            form   = win.down('form'),
            record = form.getRecord(),
            values = form.getValues();
        // Si el trabajador existe se actualiza el registro en caso contrario se crea
		if (values.tra_ide != -1){
			record.set(values);
		} else{
			record = Ext.create('ExtMVC.model.Trabajador');
			record.set(values);			
			this.getTrabajadoresStore().add(record);
        }
        win.close();        
    },
    // Función que elimina un trabajador
    deleteTrabajador: function(button) {
        var grid = this.getTrabajadorGrid(), 
            record = grid.getSelectionModel().getSelection()[0];
        //Se verifica si se selecciona una fila 
        if (record) {
            estado = record.get('est_ado');
            //Se verifica si el trabajador no ha sido eliminado
            if(estado == 0) {
                Ext.Msg.confirm('Eliminar Trabajador', 'Esta seguro de eliminar al trabajador', function (button) {
                    if (button == 'yes') {
                        estado = 'est_ado', 
                        valorEliminado = '1',
                        record.set(estado, valorEliminado); 
                    }
                });
            } else {
                Ext.Msg.alert('Advertencia', 'El trabajador ya ha sido eliminado.');    
            }
        } else {
            Ext.Msg.alert('Advertencia', 'Seleccione un registro para eliminar.');
        }
    }
});