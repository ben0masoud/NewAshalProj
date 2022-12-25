class WellLatest{


  String? UWI;
  String? FIELD;
  String? FIELD_ID;
  String? GC;
  String? GC_CONN_DATE;
  String? HEADER;
  String? HEADER_CONN_DATE;
  String? SLOT;
  String? SLOT_CONN_DATE;
  String? LIFT_METHOD;
  String? ALLOWABLE;
  String? OPERATION_STATUS;
  String? OPERATION_STATUS_DATE;
  String? AL_STATUS;
  String? CURRENT_STATUS;
  String? AL_STATUS_DATE;
  String? FACILITY_NAME;
  String? FACILITY_ID;
  String? RESERVOIR_ID;
  String? START_TIME;
  String? END_TIME;
  String? COMPLETION_OBJECTIVE;
  String? WELL_COMPLETION_S;
  String? LAST_UPDATE;
  String? LEFT_CHOKE_SIZE;
  String? RIGHT_CHOKE_SIZE;
  String? LIQUID_RATE;
  String? WHP;
  String? FLOW_LINE_PRESSURE;
  String? WC;
  String? TOTAL_GOR;
  String? LQ_HISTORY;
  String? WC_HISTORY;
  String? WHP_HISTORY;
  String? FLP_HISTORY;
  String? CHOKE_HISTORY;
  String? AL_HISTORY;
  String? GCCONN_HISTORY;
  String? GOR_HISTORY;
  String? FBHP_HISTORY;
  String? SBHP_HISTORY;
  String? WHT_HISTORY;
  String? H2S_HISTORY;
  String? H2S;
  String? H2S_DATE;
  String? WHT;
  String? WHT_DATE;
  String? PROD_HISTORY;
  String? WIRELINE_HISTORY;
  String? OPERATION_HISYORY;
  String? AREA;
  String? WELL_OWNERSHIP;
  String? WELL_OWNERSHIP_DATE;
  String? LATEST_WELL_REVIEW;
  String? OIL_API;
  String? SALT;
  String? SALINITY;
  String? SHRINKAGE_FACTOR;
  String? GAS_SPECIFIC_GRAVITY;
  String? WATER_SPECIFIC_GRAVITY;
  String? BSW;
  String? CO2;
  String? H2S_IN_OIL;
  String? H2S_IN_GAS;
  String? CHLORIDE;
  String? GAS_RATE;
  String? FBHP_DEPTH;
  String? FBHP_PRESSURE;
  String? FBHP_PRESSURE_DATUM;
  String? SBHP_DEPTH;
  String? SBHP_PRESSURE;
  String? SBHP_PRESSURE_DATUM;
  String? WCS_FINDER;
  String? WORKOVER_HISTORY;
  String? ESP_OPR_HIST;
  String? ESP_READ_HIST;
  String? BOPD;
  String? BWPD;
  String? COND;
  String? PRODDAYS;
  String? DOWNHOLE_FACILITIES;
  String? WELL_DEVIATION;
  String? SPUD_DATE;
  String? COMPLETION_DATE;
  String? DRILLERS_TD;
  String? GROUND_ELEVATION;
  String? ELEVATION;
  String? ELEVATION_REF;
  String? PRODUCTION_DATE;
  String? OIL_VOLUME;
  String? CONDENSATE_VOLUME;
  String? GAS_VOLUME;
  String? WATER_VOLUME;
  String? PRODUCTIVE_DAYS;
  String? PROD_LAST_UPDATE;
  String? LATITUDE;
  String? LONGITUDE;
  String? WLA_ACTIVITY_NAME;
  String? WLA_START_TIME;
  String? CONTRACTOR;
  String? WLA_STATUS;
  String? WLA_REMARKS;
  String? WLA_LAST_UPDATE;
  String? WT_ACTIVITY_TYPE;
  String? WT_ACTIVITY_NAME;
  String? WT_ACTIVITY_ID;
  String? DURATION;
  String? GOR_FLAG;
  String? PRESSURE_FLAG;
  String? WC_FLAG;
  String? PREFFERED_FLAG;
  String? WT_START_TIME;
  String? WT_END_TIME;
  String? WT_LAST_UPDATE;
  String? WELL_HEAD_TEMP;
  String? REASON;
  String? MFL;
  String? ZONES;

  WellLatest({
    this.UWI,
    this.FIELD,
    this.FIELD_ID,
    this.GC,
    this.GC_CONN_DATE,
    this.HEADER,
    this.HEADER_CONN_DATE,
    this.SLOT,
    this.SLOT_CONN_DATE,
    this.LIFT_METHOD,
    this.ALLOWABLE,
    this.OPERATION_STATUS,
    this.OPERATION_STATUS_DATE,
    this.AL_STATUS,
    this.CURRENT_STATUS,
    this.AL_STATUS_DATE,
    this.FACILITY_NAME,
    this.FACILITY_ID,
    this.RESERVOIR_ID,
    this.START_TIME,
    this.END_TIME,
    this.COMPLETION_OBJECTIVE,
    this.WELL_COMPLETION_S,
    this.LAST_UPDATE,
    this.LEFT_CHOKE_SIZE,
    this.RIGHT_CHOKE_SIZE,
    this.LIQUID_RATE,
    this.WHP,
    this.FLOW_LINE_PRESSURE,
    this.WC,
    this.TOTAL_GOR,
    this.LQ_HISTORY,
    this.WC_HISTORY,
    this.WHP_HISTORY,
    this.FLP_HISTORY,
    this.CHOKE_HISTORY,
    this.AL_HISTORY,
    this.GCCONN_HISTORY,
    this.GOR_HISTORY,
    this.FBHP_HISTORY,
    this.SBHP_HISTORY,
    this.WHT_HISTORY,
    this.H2S_HISTORY,
    this.H2S,
    this.H2S_DATE,
    this.WHT,
    this.WHT_DATE,
    this.PROD_HISTORY,
    this.WIRELINE_HISTORY,
    this.OPERATION_HISYORY,
    this.AREA,
    this.WELL_OWNERSHIP,
    this.WELL_OWNERSHIP_DATE,
    this.LATEST_WELL_REVIEW,
    this.OIL_API,
    this.SALT,
    this.SALINITY,
    this.SHRINKAGE_FACTOR,
    this.GAS_SPECIFIC_GRAVITY,
    this.WATER_SPECIFIC_GRAVITY,
    this.BSW,
    this.CO2,
    this.H2S_IN_OIL,
    this.H2S_IN_GAS,
    this.CHLORIDE,
    this.GAS_RATE,
    this.FBHP_DEPTH,
    this.FBHP_PRESSURE,
    this.FBHP_PRESSURE_DATUM,
    this.SBHP_DEPTH,
    this.SBHP_PRESSURE,
    this.SBHP_PRESSURE_DATUM,
    this.WCS_FINDER,
    this.WORKOVER_HISTORY,
    this.ESP_OPR_HIST,
    this.ESP_READ_HIST,
    this.BOPD,
    this.BWPD,
    this.COND,
    this.PRODDAYS,
    this.DOWNHOLE_FACILITIES,
    this.WELL_DEVIATION,
    this.SPUD_DATE,
    this.COMPLETION_DATE,
    this.DRILLERS_TD,
    this.GROUND_ELEVATION,
    this.ELEVATION,
    this.ELEVATION_REF,
    this.PRODUCTION_DATE,
    this.OIL_VOLUME,
    this.CONDENSATE_VOLUME,
    this.GAS_VOLUME,
    this.WATER_VOLUME,
    this.PRODUCTIVE_DAYS,
    this.PROD_LAST_UPDATE,
    this.LATITUDE,
    this.LONGITUDE,
    this.WLA_ACTIVITY_NAME,
    this.WLA_START_TIME,
    this.CONTRACTOR,
    this.WLA_STATUS,
    this.WLA_REMARKS,
    this.WLA_LAST_UPDATE,
    this.WT_ACTIVITY_TYPE,
    this.WT_ACTIVITY_NAME,
    this.WT_ACTIVITY_ID,
    this.DURATION,
    this.GOR_FLAG,
    this.PRESSURE_FLAG,
    this.WC_FLAG,
    this.PREFFERED_FLAG,
    this.WT_START_TIME,
    this.WT_END_TIME,
    this.WT_LAST_UPDATE,
    this.WELL_HEAD_TEMP,
    this.REASON,
    this.MFL,
    this.ZONES,

  });
  WellLatest.fromJson(Map<String, dynamic> json) {

    UWI    = json["UWI"];
    FIELD  = json["FIELD"];
    FIELD_ID = json["FIELD_ID"];
    GC = json["GC"];
    GC_CONN_DATE = json["GC_CONN_DATE"];
    HEADER = json["HEADER"];
    HEADER_CONN_DATE= json["HEADER_CONN_DATE"];
    SLOT= json["SLOT"];
    SLOT_CONN_DATE= json["SLOT_CONN_DATE"];
    LIFT_METHOD = json["LIFT_METHOD"];
    ALLOWABLE= json["ALLOWABLE"];
    OPERATION_STATUS = json["OPERATION_STATUS"];
    OPERATION_STATUS_DATE= json["OPERATION_STATUS_DATE"];
    AL_STATUS= json["AL_STATUS"];
    CURRENT_STATUS= json["CURRENT_STATUS"];
    AL_STATUS_DATE = json["AL_STATUS_DATE"];
    FACILITY_NAME= json["FACILITY_NAME"];
    FACILITY_ID = json["FACILITY_ID"];
    RESERVOIR_ID= json["RESERVOIR_ID"];
    START_TIME= json["START_TIME"];
    END_TIME= json["END_TIME"];
    COMPLETION_OBJECTIVE= json["COMPLETION_OBJECTIVE"];
    WELL_COMPLETION_S= json["WELL_COMPLETION_S"];
    LAST_UPDATE= json["LAST_UPDATE"];
    LEFT_CHOKE_SIZE = json["LEFT_CHOKE_SIZE"];
    RIGHT_CHOKE_SIZE= json["RIGHT_CHOKE_SIZE"];
    LIQUID_RATE= json["LIQUID_RATE"];
    WHP= json["WHP"];
    FLOW_LINE_PRESSURE = json["FLOW_LINE_PRESSURE"];
    WC = json["WC"];
    TOTAL_GOR = json["TOTAL_GOR"];
    LQ_HISTORY= json["LQ_HISTORY"];
    WC_HISTORY= json["WC_HISTORY"];
    WHP_HISTORY= json["WHP_HISTORY"];
    FLP_HISTORY = json["FLP_HISTORY"];
    CHOKE_HISTORY= json["CHOKE_HISTORY"];
    AL_HISTORY= json["AL_HISTORY"];
    GCCONN_HISTORY= json["GCCONN_HISTORY"];
    GOR_HISTORY= json["GOR_HISTORY"];
    FBHP_HISTORY= json["FBHP_HISTORY"];
    SBHP_HISTORY= json["SBHP_HISTORY"];
    WHT_HISTORY= json["WHT_HISTORY"];
    H2S_HISTORY= json["H2S_HISTORY"];
    H2S= json["H2S"];
    H2S_DATE= json["H2S_DATE"];
    WHT = json["WHT"];
    WHT_DATE = json["WHT_DATE"];
    PROD_HISTORY= json["PROD_HISTORY"];
    WIRELINE_HISTORY= json["WIRELINE_HISTORY"];
    OPERATION_HISYORY= json["OPERATION_HISYORY"];
    AREA = json["AREA"];
    WELL_OWNERSHIP= json["WELL_OWNERSHIP"];
    WELL_OWNERSHIP_DATE= json["WELL_OWNERSHIP_DATE"];
    LATEST_WELL_REVIEW= json["LATEST_WELL_REVIEW"];
    OIL_API= json["OIL_API"];
    SALT= json["SALT"];
    SALINITY= json["SALINITY"];
    SHRINKAGE_FACTOR= json["SHRINKAGE_FACTOR"];
    GAS_SPECIFIC_GRAVITY= json["GAS_SPECIFIC_GRAVITY"];
    WATER_SPECIFIC_GRAVITY= json["WATER_SPECIFIC_GRAVITY"];
    BSW= json["BSW"];
    CO2= json["CO2"];
    H2S_IN_OIL = json["H2S_IN_OIL"];
    H2S_IN_GAS= json["H2S_IN_GAS"];
    CHLORIDE = json["CHLORIDE"];
    GAS_RATE= json["GAS_RATE"];
    FBHP_DEPTH= json["FBHP_DEPTH"];
    FBHP_PRESSURE= json["FBHP_PRESSURE"];
    FBHP_PRESSURE_DATUM= json["FBHP_PRESSURE_DATUM"];
    SBHP_DEPTH= json["SBHP_DEPTH"];
    SBHP_PRESSURE= json["SBHP_PRESSURE"];
    SBHP_PRESSURE_DATUM= json["SBHP_PRESSURE_DATUM"];
    WCS_FINDER= json["WCS_FINDER"];
    WORKOVER_HISTORY= json["WORKOVER_HISTORY"];
    ESP_OPR_HIST= json["ESP_OPR_HIST"];
    ESP_READ_HIST= json["ESP_READ_HIST"];
    BOPD= json["BOPD"];
    BWPD= json["BWPD"];
    COND= json["COND"];
    PRODDAYS= json["PRODDAYS"];
    DOWNHOLE_FACILITIES= json["DOWNHOLE_FACILITIES"];
    WELL_DEVIATION= json["WELL_DEVIATION"];
    SPUD_DATE= json["SPUD_DATE"];
    COMPLETION_DATE= json["COMPLETION_DATE"];
    DRILLERS_TD= json["DRILLERS_TD"];
    GROUND_ELEVATION= json["GROUND_ELEVATION"];
    ELEVATION= json["ELEVATION"];
    ELEVATION_REF= json["ELEVATION_REF"];
    PRODUCTION_DATE= json["PRODUCTION_DATE"];
    OIL_VOLUME= json["OIL_VOLUME"];
    CONDENSATE_VOLUME= json["CONDENSATE_VOLUME"];
    GAS_VOLUME= json["GAS_VOLUME"];
    WATER_VOLUME= json["WATER_VOLUME"];
    PRODUCTIVE_DAYS= json["PRODUCTIVE_DAYS"];
    PROD_LAST_UPDATE= json["PROD_LAST_UPDATE"];
    LATITUDE= json["LATITUDE"];
    LONGITUDE= json["LONGITUDE"];
    WLA_ACTIVITY_NAME= json["WLA_ACTIVITY_NAME"];
    WLA_START_TIME= json["WLA_START_TIME"];
    CONTRACTOR= json["CONTRACTOR"];
    WLA_STATUS= json["WLA_STATUS"];
    WLA_REMARKS= json["WLA_REMARKS"];
    WLA_LAST_UPDATE= json["WLA_LAST_UPDATE"];
    WT_ACTIVITY_TYPE= json["WT_ACTIVITY_TYPE"];
    WT_ACTIVITY_NAME= json["WT_ACTIVITY_NAME"];
    WT_ACTIVITY_ID= json["WT_ACTIVITY_ID"];
    DURATION= json["DURATION"];
    GOR_FLAG= json["GOR_FLAG"];
    PRESSURE_FLAG= json["PRESSURE_FLAG"];
    WC_FLAG= json["WC_FLAG"];
    PREFFERED_FLAG= json["PREFFERED_FLAG"];
    WT_START_TIME= json["WT_START_TIME"];
    WT_END_TIME= json["WT_END_TIME"];
    WT_LAST_UPDATE= json["WT_LAST_UPDATE"];
    WELL_HEAD_TEMP= json["WELL_HEAD_TEMP"];
    REASON    = json["REASON"];
    MFL  = json["MFL"];
    ZONES = json["ZONES"];
  }

}