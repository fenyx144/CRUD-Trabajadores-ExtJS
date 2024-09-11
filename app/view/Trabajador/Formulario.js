//Formulario para la insercion y modificacion de un trabajador

Ext.define('ExtMVC.view.Trabajador.Formulario', {
    extend: 'Ext.window.Window',
    alias : 'widget.Trabajadorform',
    requires: ['Ext.form.Panel','Ext.form.field.Text'],
    title : 'Nuevo/Modificar Trabajador',
    layout: 'fit',
    autoShow: true,
    width: 280,    
    iconCls: 'icon-user',
    initComponent: function() {
        this.items = [
            {
                xtype: 'form',
                padding: '5 5 0 5',
                border: false,
                style: 'background-color: #fff;',
                
                fieldDefaults: {
                    anchor: '100%',
                    labelAlign: 'left',
                    allowBlank: false,
                    combineErrors: true,
                    msgTarget: 'side'
                },
                items: [
					{
                        xtype: 'textfield',
                        name : 'tra_ide',
                        fieldLabel: 'id',
                        hidden: true,
                        value: -1
					},
                    {
                        xtype: 'textfield',
                        name : 'tra_cod',
                        fieldLabel: 'CODIGO'
                    },
                    {
                        xtype: 'textfield',
                        name : 'tra_nom',
                        fieldLabel: 'NOMBRE'
                    },
                    {
                        xtype: 'textfield',
                        name : 'tra_pat',
                        fieldLabel: 'AP. PATERNO'
                    },
                    {
                        xtype: 'textfield',
                        name : 'tra_mat',
                        fieldLabel: 'AP. MATERNO'
                    },
                    {
                        xtype: 'textfield',
                        name : 'est_ado',
                        fieldLabel: 'ESTADO',
                        hidden: true
                    }
                ]
            }
        ];
        
        this.dockedItems = [{
            xtype: 'toolbar',
            dock: 'bottom',
            id:'buttons',
            ui: 'footer',
            items: ['->', {
                iconCls: 'icon-save',
                text: 'Guardar',
                action: 'save'
            },{
                iconCls: 'icon-reset',
                text: 'Cancelar',
                scope: this,
                handler: this.close
            }]
        }];
        this.callParent(arguments);
    }
});
