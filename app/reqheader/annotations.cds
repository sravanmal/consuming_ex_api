using MainService as service from '../../srv/service';
 
annotate service.ReqHeaderSet with @(
    UI.SelectionFields:[
        requestNo,
        status.statusId,
        totalPrice
    ],
    UI.LineItem:[
        {
            $Type : 'UI.DataField',
            Value : requestNo,
        },
        {
            $Type : 'UI.DataField',
            Value : requestDesc,
        },
        {
            $Type : 'UI.DataField',
            Value : status.statusText
        },
        {
            $Type : 'UI.DataField',
            Value : totalPrice,
        },
    ],
    UI.HeaderInfo:{
        TypeName:'Request Header',
        TypeNamePlural: 'Request Headers',
        Title :{Value : requestNo},
        Description:{Value: requestDesc}
    },
    UI.Facets:[
        {
            $Type : 'UI.CollectionFacet',
            Label: 'General Information',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label: 'Request Order Details',
                    Target : '@UI.Identification'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label: 'Details',
                    Target : '@UI.FieldGroup'
                },
            ],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label: 'Request Items',
            Target : 'items/@UI.LineItem',
        },
    ],
    UI.Identification:[
        {
            $Type : 'UI.DataField',
            Label : 'Request No.',
            Value : requestNo,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Status ID',
            Value : status_statusId
        }
    ],
    UI.FieldGroup:{
        Label :'Request Items',
        Data:[
            {
                $Type : 'UI.DataField',
                Label : 'Request Desc',
                Value : requestDesc,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Total Price',
                Value : totalPrice,
            }
        ]
    }
);
 
annotate service.ReqItemSet with @(
    UI.SelectionFields:[
        createdAt,
        createdBy,
        materialNo_ID
    ],
    UI.LineItem:[
        {
            $Type : 'UI.DataField',
            Label : 'Item No.',
            Value : itemNo,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Item Desc',
            Value : itemDesc,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Plant',
            Value : plant,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Material No.',
            Value : materialNo_ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Unit Price',
            Value : unitPrice,
        },
    ],
 
    UI.Facets:[
        {
            $Type : 'UI.CollectionFacet',
            Label : 'More Item Info',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'More Item Ingo',
                    Target : '@UI.Identification',
                }
               
            ],
        }
    ],
    UI.Identification:[
        {
            $Type : 'UI.DataField',
            Label : 'Item No.',
            Value : itemNo,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Item Desc',
            Value : itemDesc,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Material No.',
            Value : materialNo_ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Quantity',
            Value : quantity,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Unit Price',
            Value : unitPrice,
        },
    ]
);
 
// //next attach above defined valuehelp to respective field 

// annotate service.ReqItemSet with {
//     materialNo @(
//         Common : {
//             Text : materialNo_ID,
//          },
//          ValueList.entity: MainService.MaterialSet
//     )
// };


// //first define value help 
// @cds.odata.valuelist
// annotate service.MaterialSet with @(
//     UI.Identification : [{
//         $Type : 'UI.DataField',
//         Value : ID
//     }]
// );


annotate service.ReqItemSet {
    materialNo @Common.ValueList: { 
        CollectionPath : 'MaterialSet', 
    Parameters : [ 
      {$Type: 'Common.ValueListParameterInOut', LocalDataProperty: materialNo_ID, ValueListProperty: 'ID'},
      {$Type: 'Common.ValueListParameterOut', LocalDataProperty: itemDesc, ValueListProperty: 'Desc'},   
    ] 
    }
}

