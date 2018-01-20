/*! ***************************************************************************
 *
 * evolutility-ui-jquery :: demo.js
 *
 * Demo
 *
 * @author: Sai Deepika Gopala
 *
 *************************************************************************** */

var uidef=null;

var ViewDescriptions = {
 'browse': {name: 'Browse', desc: 'The "Browse" view shows all fields for viewing (in read only mode). Fields are grouped in panels and tabs.'},
 'edit': {name: 'Edit', desc: 'The "Edit" view shows all fields for edition to create or update models. It automatically performs validation based on the UI-model and supports the Master-Details pattern (nested collections). Fields are grouped in panels and tabs.'},
 'mini': {name: 'Mini (quick-edit)', desc: 'The "Mini" (quick-edit) view only shows important fields (required or showing as a column in grids). Fields are grouped in a single panel.'},
 'json': {name: 'JSON', desc: 'The "JSON" view shows the JSON representation of the data.'},
 'list': {name: 'List', desc: 'The "List" view gives a tabular view of a collection with paging.'},
 'cards': {name: 'Cards', desc: 'The "Cards" Shows records side by side as cards.'},
 'bubbles': {name: 'Bubbles', desc: 'The "Bubbles" view displays the data as bubbles with controls to group them and set their color and size (this view uses D3.js).'},
 'charts': {name: 'Charts', desc: 'The "Charts" view draws charts about the collection.'},
 'filter': {name: 'Filter', desc: 'The "Filter" view is used to build a structured query to filter a collection.'},
 'export': {name: 'Export', desc: 'The "Export" view let\'s you define export options and preview the collection export in different data formats (CSV, TAB, HTML, XML, SQL and JSON).'}
};

function createSampleDataIfEmpty(entityName){
    var M, MS;
    if(Evol.Config.localStorage){
        var lc = new Backbone.LocalStorage('evol-'+entityName);
        M = Backbone.Model.extend({
            localStorage: lc
        });
        Ms = Backbone.Collection.extend({
            model: M,
            localStorage: lc
        });
    }else{
        M = new Backbone.Model({
            urlRoot: Evol.Config.url+entityName
        });
        Ms = Backbone.Collection.extend({
            model: M,
            url: Evol.Config.url+entityName/*,
            sync : function(method, collection, options) {
                //options.dataType = "jsonp";
                return Backbone.sync(method, collection, options);
            }*/
        });
    }

    var ms = new Ms();
    ms.fetch({
        success: function(collection){
            // TODO remove sample data
            if(collection.length===0){
                _.each(uiModels[entityName+'_data'], function(d){
                    collection.create(d);
                });
            }
        }
    });
}

function showUIModel(uiModel){
    if(_.isString(uiModel)){
        uiModel=uiModels[uiModel];
    }
    $('#uimodel').html(Evol.DOM.input.textMJSON('uimodel2', uiModel, 12))
        .slideDown();
    $('#hide_def').show();
}

function hideUIModel(){
    $('#uimodel').slideUp();
    $('#hide_def').hide();
}

function showApp(entity, view){
    var m=uiModels[entity];
    if(m){
        $('#title').html(m.label);
        window.location.href = '#'+entity+'/'+(view||'list');
    }else{
        alert('App not defined "'+entity+'".');
    }
}
