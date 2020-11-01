pragma solidity ^0.4.0;

contract Administrator{
    
    address adminAddress;
    address[] coAdminAddress;
    
    uint[] seedGrowers;
    uint[] seedCertificationInspector;
    uint[] seedProcessingPlant;
    uint[] seedProcessingAgency;
    uint[] seedTestingLab;
    
    uint admin;
    uint[] co_admin;
    
    struct Data{
        // spaData
        // data for Seed Processing Plant
        // Owner of the seed after it intakes from the SPP
        string LotNumber;
        string owner;
        string crop;
        string variety;
        string SourceTagNo;
        string SourceClass;
        string DestinationClass;
        uint SourceQuality;
        string SourceDateOfIssue;
        string growerName;
        string spaName;
        string dateOfIssue;
        string sourceStorehouse;
        string destinationStorehouse;
        string sgName;
        string sgID;
        string FinYear;     // Financial year
        string Season;
        string landRecordsKhatano;
        string landRecordsPlotno;
        string landRecordsArea;
        string cropRegCode;
        string SppName;
        string SppID;
        string TotalQuantityProcessed;
        string processingDate;  // dd/MM/yyyy:hh:hh:mm:mm
        string verificationDate;    // dd/MM/yyyy:hh:hh:mm:mm
        string phoneNumber;

        // stlData
        // data from Seed Testing Lab
        // Updates only Seed Testing Results
        string SampleSecretCode;
        bool SamplePassed;    // "Yes" or "No"
        string SampleTestDate;
        
        // scaData
        string CertificateNo;
        string CertificateDate;
        string TagSeries;
        string TagIssuedRangeFrom;
        string TagIssuedRangeTo;
        string NoOfTagsIssued;
        string CertificateValidityInMonth;
        
        string AgencyName;
        string AgencyNumber;
        
        string LabName;
        string LabNumber;
        
        string SCA_Name;    // Seed Certification Agency Name
        string SCA_Number;
    }
    
    Data[] SeedData;
    Data[] SPA;
    Data[] STL;
    Data[] SCA;
    
    // REGION FOR REGISTRATION
    function RegisterAsGrower(string _growername, string _phoneNumber, string _crop, string _FinYear) public {
        Data storage local_var = SeedGrowerData[SeedGrowerData.length];
        local_var.growerName = _growername;
        local_var.phoneNumber = _phoneNumber;
        local_var.crop = _crop;
        local_var.FinYear - _FinYear;
    }
    
    function RegisterAsSeedProcessingAgency(string _AgencyName, string _AgencyNumber) public {
        Data storage local_var = SPA[SPA.length];
        local_var.AgencyName = _AgencyName;
        local_var.AgencyNumber = _AgencyNumber;
    }
    
    function RegisterAsSeedTestingLab(string _LabName, string _LabNumber) public{
        Data storage local_var = STL[STL.length];
        local_var.LabName = _LabName;
        local_var.LabNumber = _LabNumber;
        
    }
    
    function RegisterAsSeedCertificationAgency(string _SCA_Name, string _SCA_Number) public{
        Data storage local_var = SCA[SCA.length];
        local_var.SCA_Name = _SCA_Name;
        local_var.SCA_Number = _SCA_Number;
    }
    
    function UpdateDataAsSeedProducingAgency(uint access_index, string _LotNumber, string _owner, string _crop, string _variety, string _SourceTagNo, string _SourceClass, uint _SourceQuality, string _SourceDateOfIssue, string _SourceStoreHouse, string _TotalQuantityProcessed, string _processingDate ) public {
        Data storage local_var = SeedProcessingAgencyData[access_index];
        local_var.LotNumber = _LotNumber;
        local_var.owner = _owner;
        local_var.crop = _crop;
        local_var.variety = _variety;
        local_var.SourceTagNo = _SourceTagNo;
        local_var.SourceClass = _SourceClass;
        local_var.SourceQuality = _SourceQuality;
        local_var.SourceDateOfIssue = _SourceDateOfIssue;
        local_var.sourceStorehouse = _SourceStoreHouse;
        local_var.TotalQuantityProcessed = _TotalQuantityProcessed;
        local_var.processingDate = _processingDate;
    }
    
    function UpdateDataAsGrower(uint access_index, string _LotNumber, string _owner, string _crop, string _variety, string _SourceTagNo, string _SourceDateOfIssue, string _SourceClass, string _DestinationClass, string _dateOfIssue, string _FinYear, string _Season, string _landRecordsArea, string _landRecordsPlotno, string _landRecordsKhatano) public{
        Data storage local_var = SeedData[access_index];
        local_var.LotNumber = _LotNumber;
        local_var.owner = _owner;
        local_var.crop = _crop;
        local_var.variety = _variety;
        local_var.SourceTagNo = _SourceTagNo;
        local_var.SourceDateOfIssue = _SourceDateOfIssue;
        local_var.SourceClass = _SourceClass;
        local_var.DestinationClass = _DestinationClass;
        local_var.dateOfIssue = _dateOfIssue;
        local_var.FinYear = _FinYear;
        local_var.Season = _Season;
        local_var.landRecordsArea = _landRecordsArea;
        local_var.landRecordsPlotno = _landRecordsPlotno;
        local_var.landRecordsKhatano = _landRecordsKhatano;
    }
    
    function UpdateAsSeedTestingLab(uint access_index, string _SampleSecretCode, bool _SamplePassed, string _SampleTestDate) public {
        Data storage local_var = SeedData[access_index];
        local_var.SampleSecretCode = _SampleSecretCode;
        local_var.SamplePassed = _SamplePassed;
        local_var.SampleTestDate = _SampleTestDate;
    }
    
    function UpdateSeedCertificate(uint _access_index, string _CertificateNo, string _CertificateDate, string _TagSeries, string _TagIssuedRangeFrom; string _TagIssuedRangeTo, string _NoOfTagsIssued, string _CertificateValidityInMonth) public {
        Data storage local_var = SeedData[access_index];
        local_var.CertificateNo = _CertificateNo;
        local_var.CertificateDate = _CertificateDate;
        local_var.TagSeries = _TagSeries;
        local_var.TagIssuedRangeFrom = _TagIssuedRangeFrom;
        local_var.TagIssuedRangeTo = _TagIssuedRangeTo;
        local_var.NoOfTagsIssued = _NoOfTagsIssued;
        local_var.CertificateValidityInMonth = _CertificateValidityInMonth;
    }
    
    function ViewDetailsOfSeed(uint access_index) constant public returns(string, string, string, string, string, string, string, string){
        return (SeedData[access_index].LotNumber, SeedData[access_index].owner, SeedData[access_index].crop, SeedData[access_index].variety, SeedData[access_index].SourceTagNo, SeedData[access_index].growerName, SeedData[access_index].spaName, SeedData[access_index].dateOfIssue);
    }
    
    function CurrentOwnerOfSeedLot(uint access_index) constant public returns(string){
        SeedData[access_index].owner;
    }
    
    function UpdateTestResults(string _SampleSecretCode, bool _SamplePassed, string _SampleTestDate) public{
        for(uint i=0; i<SeedData.length; i++){
            if(SeedData[i].SampleSecretCode == _SampleSecretCode){
                SeedData[i].SamplePassed = _SamplePassed;
                SeedData[i],SampleTestDate = _SampleTestDate;
            }
        }
    }
    
    function ViewTestResults(string _SampleSecretCode) constant public returns(string, bool, string){
        for(uint i=0; i<SeedData.length; i++)
        {
            if(SeedData[i].SampleSecretCode == _SampleSecretCode){
                return (SeedData[i].SampleSecretCode; SeedData[i].SamplePassed; SeedData[i].SampleTestDate);
            }
        }
    }
    
    
    
    
}
