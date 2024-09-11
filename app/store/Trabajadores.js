/*
    Store donde se define la interaccion con la base de datos
    Se define las cuatro operaciones para el CRUD
    y la forma de envio y recepcion de datos
*/
Ext.define('ExtMVC.store.Trabajadores', {
    extend: 'Ext.data.Store',
    model: 'ExtMVC.model.Trabajador',
    autoLoad: true,
    autoSync: true,
    proxy: {
        type: 'ajax',
        api: {
        	create: 'bd/save_trabajador.php', 
            read: 'bd/get_trabajadores.php',
            update: 'bd/update_trabajador.php',
            destroy: 'bd/delete_trabajador.php'
        },
        reader: {
            type: 'json',
            root: 'data',
            successProperty: 'success'
        },
        writer: {
            type: 'json',
            encode: true,
            root: 'data',
            writeAllFields: true,
        }
    }
});