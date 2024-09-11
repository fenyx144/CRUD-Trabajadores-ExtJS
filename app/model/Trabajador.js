//Modelo para un trabajador

Ext.define('ExtMVC.model.Trabajador', {
    extend: 'Ext.data.Model',
    fields: [
            'tra_ide', 
            'tra_cod',
            'tra_nom',
            'tra_pat',
            'tra_mat',
            'est_ado'
    ],
    idProperty: 'tra_ide'
});
