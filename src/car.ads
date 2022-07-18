package car with SPARK_Mode
is 
   --Types--
   type CarPower is (On, Off);
   type ParkedMode is (On, Off);  
   type MaintenanceMode is (On, Off);
   type Battery is range 0..100;
   type CarSpeed is range 0..150; 
   type MaxSpeed is range 80..80;
   type Gear is range -1..5;
   type Charging is (Yes, No);
   type ObjectDetected is (Yes, No); 
   
   
   
   --Car Record-- 
   type Car is record
      --all values within car--
      PowerStatus : CarPower;
      Parked : ParkedMode;
      Maintenance : MaintenanceMode;
      BatteryStatus : Battery;
      Speed : CarSpeed;
      TopSpeed : MaxSpeed;
      CarGear : Gear;
      AtChargingStation : Charging;
      Object : ObjectDetected;
      
      end record;
      
   
   --CarSystem is instance of Car Record--
   CarSystem : Car := 
     (PowerStatus => Off, 
      Parked => On,
      Maintenance => Off,
      Speed => 0,
      TopSpeed => 80,
      BatteryStatus => 4,
      CarGear =>0,
      AtChargingStation => No,
      Object => No);

                        
     
   
   --TURN ENGINE ON--
   procedure EngineOn with 
     --Uses CarSystem--
     Global => (In_Out => CarSystem),
     Pre => (CarSystem.PowerStatus = Off 
             and CarSystem.Parked = On 
             and CarSystem.Maintenance = Off
             and CarSystem.BatteryStatus >=10
             and CarSystem.BatteryStatus <=100),
               
     Post => (CarSystem.PowerStatus = On 
             and CarSystem.Parked = On 
             and CarSystem.Maintenance = Off
             and CarSystem.BatteryStatus >=10
             and CarSystem.BatteryStatus <=100);
   
   
   
   --TURN ENGINE OFF
   procedure EngineOff with 
     --Uses CarSystem--
     Global => (In_Out => CarSystem),
     Pre => (CarSystem.PowerStatus = On 
             and CarSystem.Parked = On 
             and CarSystem.Speed = 0
             and CarSystem.CarGear = 0
             and CarSystem.Maintenance = Off),
               
     Post => (CarSystem.PowerStatus = Off
             and CarSystem.Parked = On 
             and CarSystem.Maintenance = Off);
   
   
   
  
   --TURN PARKED MODE ON
   procedure ParkedOn with 
     --Uses CarSystem--
     Global => (In_Out => CarSystem),
     Pre => (CarSystem.Parked = Off 
             and CarSystem.Speed = 0
             and CarSystem.Maintenance = Off),
               
       
     Post => (CarSystem.Parked = On);
   
   
   
   --TURN PARKED MODE OFF
   procedure ParkedOff with 
     --Uses CarSystem--
     Global => (In_Out => CarSystem),
     Pre => (CarSystem.Parked = On 
             and CarSystem.Speed = 0
             and CarSystem.Maintenance = Off),
               
       
     Post => (CarSystem.Parked = Off);
   
   
   
   --SPECIFICATION 7
   --TURN MAINTENANCE ON
   procedure DiagnosticOn with 
     --Uses CarSystem--
     Global => (In_Out => CarSystem),
     Pre => (CarSystem.Parked = On
             and CarSystem.Speed = 0 
             and CarSystem.Maintenance = Off),
               
       
     Post => (CarSystem.Maintenance = On);
   
   
   
   
   --SPECIFICATION 7
   --TURN MAINTENANCE OFF
   procedure DiagnosticOff with 
     --Uses CarSystem--
     Global => (In_Out => CarSystem),
     Pre => (CarSystem.Parked = On
             and CarSystem.Speed = 0 
             and CarSystem.Maintenance = On),
               
       
     Post => (CarSystem.Maintenance = Off);
   
   
   
   procedure SpeedUp with 
     --Uses CarSystem--
     Global => (In_Out => CarSystem),
     Pre => (  CarSystem.PowerStatus = On
               and CarSystem.CarGear <= 5
               and CarSystem.Parked = Off),
               
     Post => (CarSystem.PowerStatus = On 
              and CarSystem.Parked = Off );
   
   
      procedure SlowDown with 
     --Uses CarSystem--
     Global => (In_Out => CarSystem),
     Pre => (   CarSystem.PowerStatus = On
               and CarSystem.Parked = Off),
               
     Post => (CarSystem.PowerStatus = On 
              and CarSystem.Parked = Off );
   
   

       
   --CHARGE CAR 
   procedure ChargeCar with 
     --Uses CarSystem--
     Global => (In_Out => CarSystem),
            Pre => (CarSystem.PowerStatus = Off
                    and CarSystem.Parked = On 
                    and CarSystem.Speed = 0 
                    and CarSystem.AtChargingStation = Yes
                    ),
               
     Post => (CarSystem.PowerStatus = Off 
              and CarSystem.Parked = On 
              and CarSystem.Speed = 0);

     
       
       
       procedure GearUp with 
       --Uses CarSystem--
     Global => (In_Out => CarSystem),
                   Pre => (CarSystem.PowerStatus = On
                    and CarSystem.Speed = 0                     
                           and CarSystem.Parked = Off
                             and CarSystem.CarGear <5
                    ),
               
     Post => (CarSystem.PowerStatus = On 
              and CarSystem.Parked = Off 
             and CarSystem.CarGear <= 5);
       
       
       
              procedure GearDown with 
       --Uses CarSystem--
     Global => (In_Out => CarSystem),
                   Pre => (CarSystem.PowerStatus = On
                    and CarSystem.Speed = 0                     
                           and CarSystem.Parked = Off
                             and CarSystem.CarGear > -1
                    ),
               
     Post => (CarSystem.PowerStatus = On 
              and CarSystem.Parked = Off 
             and CarSystem.CarGear >= -1);
    end car;
