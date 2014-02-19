%%hdf_quadrangle_5km
%%arr 11/19/2009
%%uses functions exchange_coord,round01,calcline,clip

Time=zeros(maxx,maxy);
ViewingZenithAngle=zeros(maxx,maxy);
SolarZenithAngle=zeros(maxx,maxy);
ViewingAzimuthAngle=zeros(maxx,maxy);
SolarAzimuthAngle=zeros(maxx,maxy);
AMFInitial=zeros(maxx,maxy);
AMFPolluted=zeros(maxx,maxy);
AMFUnpolluted=zeros(maxx,maxy);
CloudFraction=zeros(maxx,maxy);
CloudRadianceFraction=zeros(maxx,maxy);
ColumnAmountNO2=zeros(maxx,maxy);
ColumnAmountNO2Initial=zeros(maxx,maxy);
ColumnAmountNO2Polluted=zeros(maxx,maxy);
SlantColumnAmountNO2=zeros(maxx,maxy);
TerrainHeight=zeros(maxx,maxy);
TerrainPressure=zeros(maxx,maxy);
TerrainReflectivity=zeros(maxx,maxy);
vcdQualityFlags=zeros(maxx,maxy);
CloudPressure=zeros(maxx,maxy);
RelativeAzimuthAngle=zeros(maxx,maxy);
Latitude=zeros(maxx,maxy);
Longitude=zeros(maxx,maxy);
Pixel=zeros(maxx,maxy);
ColumnAmountNO2Trop=zeros(maxx,maxy);
%NewAmf=zeros(maxx,maxy);
Areaweight=zeros(maxx,maxy);
GroundPixelQualityFlags=zeros(maxx,maxy);
StratosphericVerticalColumn=zeros(maxx,maxy);
%NewTerpres=zeros(maxx,maxy);
%NewAlbedo=zeros(maxx,maxy);
%NewColumnAmountNO2Polluted=zeros(maxx,maxy);
%NewColumnAmountNO2Trop=zeros(maxx,maxy);
Row=zeros(maxx,maxy);

for x=1:1:Dimensions(1);
y=1;

pixelarea=(m_lldist([Lon1(x,y) Lon2(x,y)],[Lat1(x,y) Lat2(x,y)])/1000)*13;

x1=round(lCoordLat(x,y,1));
y1=round(lCoordLon(x,y,1));
x2=round(lCoordLat(x,y,2));
y2=round(lCoordLon(x,y,2));
x3=round(lCoordLat(x,y,3));
y3=round(lCoordLon(x,y,3));
x4=round(lCoordLat(x,y,4));
y4=round(lCoordLon(x,y,4));

if y2<y1; [x1,y1,x2,y2]=exchange_coord(x1,y1,x2,y2); end
if y3<y1; [x1,y1,x3,y3]=exchange_coord(x1,y1,x3,y3); end
if y4<y1; [x1,y1,x4,y4]=exchange_coord(x1,y1,x4,y4); end
if y2>y3; [x2,y2,x3,y3]=exchange_coord(x2,y2,x3,y3); end
if y4>y3; [x4,y4,x3,y3]=exchange_coord(x4,y4,x3,y3); end
if x4>x2; [x4,y4,x2,y2]=exchange_coord(x4,y4,x2,y2); end

Time_i=Data(d).Time;
ViewingZenithAngle_i=Data(d).ViewingZenithAngle;
SolarZenithAngle_i=Data(d).SolarZenithAngle;
ViewingAzimuthAngle_i=Data(d).ViewingAzimuthAngle;
SolarAzimuthAngle_i=Data(d).SolarAzimuthAngle;
AMFInitial_i=Data(d).AMFInitial;
AMFPolluted_i=Data(d).AMFPolluted;
AMFUnpolluted_i=Data(d).AMFUnpolluted;
CloudFraction_i=Data(d).CloudFraction;
CloudRadianceFraction_i=Data(d).CloudRadianceFraction;
ColumnAmountNO2_i=Data(d).ColumnAmountNO2;
ColumnAmountNO2Initial_i=Data(d).ColumnAmountNO2Initial;
ColumnAmountNO2Polluted_i=Data(d).ColumnAmountNO2Polluted;
SlantColumnAmountNO2_i=Data(d).SlantColumnAmountNO2;
TerrainHeight_i=Data(d).TerrainHeight;
TerrainPressure_i=Data(d).TerrainPressure;
TerrainReflectivity_i=Data(d).TerrainReflectivity;
vcdQualityFlags_i=Data(d).vcdQualityFlags;
CloudPressure_i=Data(d).CloudPressure;
RelativeAzimuthAngle_i=Data(d).RelativeAzimuthAngle;
Latitude_i=Data(d).Latitude;
Longitude_i=Data(d).Longitude;
Pixel_i=1:length(Data(d).Longitude);
ColumnAmountNO2Trop_i=Data(d).ColumnAmountNO2Trop;
%StratosphericVerticalColumn_i=Data(d).StratosphericVerticalColumn;
%NewAmf_i=Data(d).NewAmf;
%NewTerpres_i=Data(d).NewTerpres;
%NewAlbedo_i=Data(d).NewAlbedo;
%GroundPixelQualityFlags_i=Data(d).GroundPixelQualityFlags;
%NewColumnAmountNO2Polluted_i=Data(d).NewColumnAmountNO2Polluted;
%NewColumnAmountNO2Trop_i=Data(d).NewColumnAmountNO2Trop;
Row_i=Data(d).Row;

Time_val=Time_i(x);
ViewingZenithAngle_val=ViewingZenithAngle_i(x);
SolarZenithAngle_val=SolarZenithAngle_i(x);
ViewingAzimuthAngle_val=ViewingAzimuthAngle_i(x);
SolarAzimuthAngle_val=SolarAzimuthAngle_i(x);
AMFInitial_val=AMFInitial_i(x);
AMFPolluted_val=AMFPolluted_i(x);
AMFUnpolluted_val=AMFUnpolluted_i(x);
CloudFraction_val=CloudFraction_i(x);
CloudRadianceFraction_val=CloudRadianceFraction_i(x);
ColumnAmountNO2_val=ColumnAmountNO2_i(x);
ColumnAmountNO2Initial_val=ColumnAmountNO2Initial_i(x);
ColumnAmountNO2Polluted_val=ColumnAmountNO2Polluted_i(x);
SlantColumnAmountNO2_val=SlantColumnAmountNO2_i(x);
TerrainHeight_val=TerrainHeight_i(x);
TerrainPressure_val=TerrainPressure_i(x);
TerrainReflectivity_val=TerrainReflectivity_i(x);
vcdQualityFlags_val=vcdQualityFlags_i(x);
CloudPressure_val=CloudPressure_i(x);
RelativeAzimuthAngle_val=RelativeAzimuthAngle_i(x);
Latitude_val=Latitude_i(x);
Longitude_val=Longitude_i(x);
Pixel_val=Pixel_i(x);
ColumnAmountNO2Trop_val=ColumnAmountNO2Trop_i(x);
%StratosphericVerticalColumn_val=StratosphericVerticalColumn_i(x);
%NewAmf_val=NewAmf_i(x);
%NewTerpres_val=NewTerpres_i(x);
%NewAlbedo_val=NewAlbedo_i(x);
%GroundPixelQualityFlags_val=GroundPixelQualityFlags_i(x);
%NewColumnAmountNO2Polluted_val=NewColumnAmountNO2Polluted_i(x);
%NewColumnAmountNO2Trop_val=NewColumnAmountNO2Trop_i(x);
Row_val=Row_i(x);

bottom=y1;%y1 
top=y3-1;%y3-1
dim=[maxx maxy];
if (bottom<dim(2)) && (top>=1);
    bottom=clip(bottom,1,dim(2));
    top=clip(top,1,dim(2));
end

for y=bottom:1:top;
    if (x2>=calcline(y2,x1,y1,x3,y3)) && (x4<=calcline(y4,x1,y1,x3,y3));
        if y<y4; 
            left=calcline(y,x1,y1,x4,y4);
        else 
            left=calcline(y,x4,y4,x3,y3);
        end
        if y<y2; 
            right=calcline(y,x1,y1,x2,y2);
        else 
            right=calcline(y,x2,y2,x3,y3);
        end
    else 
        left=calcline(y,x1,y1,x3,y3);
        if y2>y4; 
            [x4,y4,x2,y2]=exchange_coord(x4,y4,x2,y2);
        end
        if y<y2; 
            right=calcline(y,x1,y1,x2,y2);
        elseif y<y4; 
            right=calcline(y,x2,y2,x4,y4);
        else 
            right=calcline(y,x4,y4,x3,y3);
        end
        if (x2<=calcline(y2,x1,y1,x3,y3)) && (x4<=calcline(y4,x1,y1,x3,y3));
            placeholder=left; 
            left=right;
            right=placeholder;
        end
    end
    right=right-1;
    if left<=0;
    elseif (dim(1)>=right>=1) && (1<=left<dim(1));
        clip(left,1,dim(1));
        clip(right,1,dim(1));
        for x=left:right; %left, right
            if Time(x,y)~=0;
                Time(x,y)=mean([Time(x,y);Time_val]);
                ViewingZenithAngle(x,y)=mean([ViewingZenithAngle(x,y),ViewingZenithAngle_val]);
                SolarZenithAngle(x,y)=mean([SolarZenithAngle(x,y),SolarZenithAngle_val]);
                ViewingAzimuthAngle(x,y)=mean([ViewingAzimuthAngle(x,y),ViewingAzimuthAngle_val]);
                SolarAzimuthAngle(x,y)=mean([SolarAzimuthAngle(x,y),SolarAzimuthAngle_val]);
                AMFInitial(x,y)=mean([AMFInitial(x,y),AMFInitial_val]);
                AMFPolluted(x,y)=mean([AMFPolluted(x,y),AMFPolluted_val]);
                AMFUnpolluted(x,y)=mean([AMFUnpolluted(x,y),AMFUnpolluted_val]);
                CloudFraction(x,y)=mean([CloudFraction(x,y),CloudFraction_val]);
                CloudRadianceFraction(x,y)=mean([CloudRadianceFraction(x,y),CloudRadianceFraction_val]);
                ColumnAmountNO2(x,y)=mean([ColumnAmountNO2(x,y),ColumnAmountNO2_val]);
                ColumnAmountNO2Initial(x,y)=mean([ColumnAmountNO2Initial(x,y),ColumnAmountNO2Initial_val]);
                ColumnAmountNO2Polluted(x,y)=mean([ColumnAmountNO2Polluted(x,y),ColumnAmountNO2Polluted_val]);
                SlantColumnAmountNO2(x,y)=mean([SlantColumnAmountNO2(x,y),SlantColumnAmountNO2_val]);
                TerrainHeight(x,y)=mean([TerrainHeight(x,y),TerrainHeight_val]);
                TerrainPressure(x,y)=mean([TerrainPressure(x,y),TerrainPressure_val]);
                TerrainReflectivity(x,y)=mean([TerrainReflectivity(x,y),TerrainReflectivity_val]);
                vcdQualityFlags(x,y)=mean([vcdQualityFlags(x,y),vcdQualityFlags_val]);
                CloudPressure(x,y)=mean([CloudPressure(x,y),CloudPressure_val]);
                RelativeAzimuthAngle(x,y)=mean([RelativeAzimuthAngle(x,y),RelativeAzimuthAngle_val]);
                Latitude(x,y)=mean([Latitude(x,y),Latitude_val]);
                Longitude(x,y)=mean([Longitude(x,y),Longitude_val]);
                Pixel(x,y)=mean([Pixel(x,y),Pixel_val]);
                Area(x,y)=mean([Area(x,y);pixelarea]);
                Areaweight(x,y)=2/Area(x,y);
                ColumnAmountNO2Trop(x,y)=mean([ColumnAmountNO2Trop(x,y),ColumnAmountNO2Trop_val]);
                %GroundPixelQualityFlags(x,y)=mean([GroundPixelQualityFlags(x,y),GroundPixelQualityFlags_val]);
                %StratosphericVerticalColumn(x,y)=mean([StratosphericVerticalColumn(x,y),StratosphericVerticalColumn_val]);
                %NewAmf(x,y)=mean([NewAmf(x,y),NewAmf_val]);
                %NewTerpres(x,y)=mean([NewTerpres(x,y),NewTerpres_val]);
                %NewAlbedo(x,y)=mean([NewAlbedo(x,y),NewAlbedo_val]);
                %FitQualityFlags(x,y)=mean([FitQualityFlags(x,y),FitQualityFlags_val]);
                %MeasurementQualityFlags(x,y)=mean([MeasurementQualityFlags(x,y),MeasurementQualityFlags_val]);
                %NewColumnAmountNO2Polluted(x,y)=mean([NewColumnAmountNO2Polluted(x,y),NewColumnAmountNO2Polluted_val]);
                %NewColumnAmountNO2Trop(x,y)=mean([NewColumnAmountNO2Trop(x,y),NewColumnAmountNO2Trop_val]);
                Row(x,y)=mean([Row(x,y),Row_val]);
            else
            Time(x,y)=Time_val;
            ViewingZenithAngle(x,y)=ViewingZenithAngle_val;
            SolarZenithAngle(x,y)=SolarZenithAngle_val;
            ViewingAzimuthAngle(x,y)=ViewingAzimuthAngle_val;
            SolarAzimuthAngle(x,y)=SolarAzimuthAngle_val;
            AMFInitial(x,y)=AMFInitial_val;
            AMFPolluted(x,y)=AMFPolluted_val;
            AMFUnpolluted(x,y)=AMFUnpolluted_val;
            CloudFraction(x,y)=CloudFraction_val;
            CloudRadianceFraction(x,y)=CloudRadianceFraction_val;
            ColumnAmountNO2(x,y)=ColumnAmountNO2_val;
            ColumnAmountNO2Initial(x,y)=ColumnAmountNO2Initial_val;
            ColumnAmountNO2Polluted(x,y)=ColumnAmountNO2Polluted_val;
            SlantColumnAmountNO2(x,y)=SlantColumnAmountNO2_val;
            TerrainHeight(x,y)=TerrainHeight_val;
            TerrainPressure(x,y)=TerrainPressure_val;
            TerrainReflectivity(x,y)=TerrainReflectivity_val;
            vcdQualityFlags(x,y)=vcdQualityFlags_val;
            CloudPressure(x,y)=CloudPressure_val;
            RelativeAzimuthAngle(x,y)=RelativeAzimuthAngle_val;
            Latitude(x,y)=Latitude_val;
            Longitude(x,y)=Longitude_val;
            Pixel(x,y)=Pixel_val;
            Area(x,y)=pixelarea;
            Areaweight(x,y)=1/Area(x,y);
            ColumnAmountNO2Trop(x,y)=ColumnAmountNO2Trop_val;
            %StratosphericVerticalColumn(x,y)=StratosphericVerticalColumn_val;
            %NewAmf(x,y)=NewAmf_val;
            %NewTerpres(x,y)=NewTerpres_val;
            %NewAlbedo(x,y)=NewAlbedo_val;
            %GroundPixelQualityFlags(x,y)=GroundPixelQualityFlags_val;
            %NewColumnAmountNO2Polluted(x,y)=NewColumnAmountNO2Polluted_val;
            %NewColumnAmountNO2Trop(x,y)=NewColumnAmountNO2Trop_val;
            Row(x,y)=Row_val;
            end
        end
    end
end
end
