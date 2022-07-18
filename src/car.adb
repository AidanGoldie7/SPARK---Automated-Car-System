package body car with SPARK_Mode
is
   
   --TURN ENGINE ON
   procedure EngineOn                
   is
   begin 
      if CarSystem.PowerStatus = Off 
        and CarSystem.Parked = On 
        and CarSystem.Maintenance = Off 
        and CarSystem.BatteryStatus >= 10 
        and CarSystem.BatteryStatus <= 100
      then CarSystem.PowerStatus := On;
      end if;                
   end EngineOn;
   
   
   
   --TURN ENGINE OFF
   procedure EngineOff
   is
   begin 
        if CarSystem.PowerStatus = On
        and CarSystem.Parked = On 
        and CarSystem.Speed = 0
        and CarSystem.CarGear = 0
        and CarSystem.Maintenance = Off 
      then CarSystem.PowerStatus := Off; 
      end if;
      end EngineOff;
   
      
   
   
   --TURN PARKED MODE ON
   procedure ParkedOn
   is
   begin 
        if CarSystem.Parked = Off
        and CarSystem.Speed = 0 
        and CarSystem.Maintenance = Off 
      then CarSystem.Parked := On; 
      end if;
   end ParkedOn;
   
   
   
   
   --TURN PARKED MODE OFF
      procedure ParkedOff
   is
   begin 
        if CarSystem.Parked = On
        and CarSystem.Speed = 0 
        and CarSystem.Maintenance = Off 
      then CarSystem.Parked := Off; 
      end if;
   end ParkedOff;
   
   
   
   
   --SPECIFICATION 7
   --TURN MAINTENANCE ON
   procedure DiagnosticOn
   is
   begin 
      if CarSystem.Parked = On
        and CarSystem.Speed = 0 
        and CarSystem.Maintenance = Off 
      then CarSystem.Maintenance := On; 
      end if;
   end DiagnosticOn;
   
   
   
   
   --SPECIFICATION 7
   --TURN MAINTENANCE OFF
   procedure DiagnosticOff
   is
   begin 
      if CarSystem.Parked = On
        and CarSystem.Speed = 0 
        and CarSystem.Maintenance = On 
      then CarSystem.Maintenance := Off; 
      end if;
   end DiagnosticOff;
   
   
   
   
   --SPEED UP
   procedure SpeedUp
   is 
   begin
      if CarSystem.PowerStatus = On 
        and CarSystem.Speed < 80 
        and CarSystem.Parked = Off
      then CarSystem.Speed := CarSystem.Speed + 10;
      end if;
   end speedUp;
   
   
   
   
   --SLOW DOWN
   procedure SlowDown
   is 
   begin
      if CarSystem.PowerStatus = On 
        and CarSystem.Speed >= 10  
        and CarSystem.Parked = Off
      then CarSystem.Speed := CarSystem.Speed - 10;
      end if;
   end SlowDown;
   
   
   
   
   --Charge Car 
   procedure ChargeCar
   is 
   begin 
      if CarSystem.PowerStatus = Off     
        and CarSystem.Speed = 0 
        and CarSystem.Parked = On 
        and CarSystem.AtChargingStation = Yes
      then 
        CarSystem.BatteryStatus := 100; 
      end if; 
      end ChargeCar;
        
   
   
      --GearUp
   procedure GearUp
   is 
   begin
      if CarSystem.PowerStatus = On 
        and CarSystem.Speed = 0  
        and CarSystem.Parked = Off
                  and CarSystem.CarGear <5 
      then CarSystem.CarGear := CarSystem.CarGear + 1;
      end if;
   end GearUp;
   
   
   
   --GearDown
   procedure GearDown
   is 
   begin
      if CarSystem.PowerStatus = On 
        and CarSystem.Speed = 0  
        and CarSystem.Parked = Off
                  and CarSystem.CarGear > -2
      then CarSystem.CarGear := CarSystem.CarGear - 1;
      end if;
   end GearDown;
   
   
   
   
   
   
   
   
   
   
   
   
                       
                    
end car;
