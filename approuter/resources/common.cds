using riskmanagement as rm from '../db/schema';

annotate rm.Risks with {
    ID          @title : 'Risk';
    title       @title : 'Title';
    owner       @title : 'Owner';
    prio        @title : 'Priority';
    descr       @title : ' Description';
    miti        @title : 'Mitigation';
    impact      @title : 'Impact';
    bp          @title : 'Business Partner';
    criticality @title : 'Criticality';
};

annotate rm.Mitigations with {
    ID    @(
        UI.Hidden,
        common : {Text : descr}
    );
    owner @title : 'Owner';
    descr @title : 'Description'

};

annotate rm.BusinessPartners with {
    BusinessPartner @(
        UI.Hidden,
        common : {Text : LastName}
    );
    LastName        @title : 'Last Name';
    FirstName       @title : 'First Name'
};

annotate rm.Risks with {
    miti @(Common : {
        Text            : miti.descr,
        TextArrangement : #TextOnly,
        ValueList       : {
            Label          : 'Mitigations',
            CollectionPath : 'Mitigations',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : miti_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'descr'
                }
            ]
        },
    }, );
    bp   @(Common : {
        Text            : bp.LastName,
        TextArrangement : #TextOnly,
        ValueList       : {
            Label          : 'Business Parters',
            CollectionPath : 'BusinesPartners',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : bp_BusinessPartner,
                    ValueListProperty : 'BusinessPartner'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'LastName'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'FirstName'
                }
            ]
        }

    });
};
