with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;
with ada.numerics.discrete_random;
with car; use car;


procedure Main
is
   --determine which number the user enters--
   answer : String(1..2);
   Last : Natural;



begin

   --MENU
   Put_Line ("");
   Put_Line ("");
   Put_Line ("Automated Driving Assistant at the ready!");

   Put_Line ("");
   Put_Line ("Please chose a command from the following menu:");
   Put_Line ("");
   Put_Line ("GENERAL : ");
   Put_Line ("1 - Turn Car On");
   Put_Line ("2 - Turn Car Off");
   Put_Line ("3 - Turn On Parked Mode");
   Put_Line ("4 - Turn Off Parked Mode");
   Put_Line ("5 - Turn On Diagnostic Mode");
   Put_Line ("6 - Turn Off Diagnostic Mode");
   Put_Line ("c - Charge Car");
   Put_Line ("s - At Charging Station");
   Put_Line ("n - Not At Charging Station");
   Put_Line ("m - View Menu");
   Put_Line ("");

   Put_Line ("DRIVER ASSISNTANCE :");
   Put_Line ("a - Increase Speed by 10mph");
   Put_Line ("r - Decrease Speed by 10mph");
   Put_Line ("u - Gear Up");
   Put_Line ("d - Gear Down");
   Put_Line("");

   Put_Line ("Press any other character to exit.");
   Put_Line ("");





   loop
      --STATS
      Put_Line("-----------------------------");
      Put_Line (" ");
      Put_Line ("Stats :");
      Put_Line (" ");
      Put_Line("Battery Status       :" & CarSystem.BatteryStatus'Image & "%");
      Put_Line("Engine(1/2)          : " & CarSystem.PowerStatus'Image);
      Put_Line("Parked Mode(3/4)     : " & CarSystem.Parked'Image);
      Put_Line("Diagnostic Mode(5/6) : " & CarSystem.Maintenance'Image);
      Put_Line("Speed(a/r)           :" & CarSystem.Speed'Image & "mph");
      Put_Line("Gear(u/d)            :" & CarSystem.CarGear'Image);
      Put_Line("Ready to Charge(s/n) : " & CarSystem.AtChargingStation'Image);



      if CarSystem.PowerStatus = On
      then CarSystem.BatteryStatus := CarSystem.BatteryStatus - 2;
      end if;



      --SPECIFICATION 7--
      --If in maintenance mode, no other commands can be run
      if CarSystem.Maintenance = On
      then
         loop
            Put_Line("-----------------------------");
            Put_Line("Diagnostic Mode Enabled. Press 6 to exit diagnostic mode(6) :");
            Put_Line("Enter Command Number :");
            Get_Line (answer, Last);

            case answer(1) is
               when '6' =>
                  Put_Line ("");
                  Put_Line ("Deactivating Diagnostic Mode...");
                  DiagnosticOff;
                  Put_Line("Diagnostic Mode : ");
                  Put_Line(CarSystem.Maintenance'Image);
                  exit;
               when others => exit;
            end case;
         end loop;

        else


      --SPECIFICATION 3
      --if car battery low when in motion
      if CarSystem.Speed > 0 and CarSystem.BatteryStatus < 10
         then
         Put_Line("WARNING : Car Battery Low");
         end if;







      --getting number from list of commands--
         Put_Line("");
         Put_Line("-----------------------------");


         Put_Line ("Enter Command Number :");
         Get_Line (answer, Last);



      --depending on what user inputs--
      case answer(1) is
         when '1' =>
            --SPECIFICATION 1
            --Car cannot be turned on in parked mode
            if CarSystem.Parked = Off
            then
                  Put_Line ("Car cannot be turned on when Parked Mode is Off");
            else
            --SPECIFICATION 2
            --Car cant be driven unless there is a minimum charge of 10 or above
            if CarSystem.BatteryStatus < 10
            then
                  Put_Line("WARNING: Car Cannot be driven until at least 10% charged, please charge your car.");
            else
                  EngineOn;
                  Put_Line("Turning on Engine...");
                  Put_Line("Engine : " & CarSystem.PowerStatus'Image);
                  Put_Line ("");
            end if;
            end if;





         when '2' =>
            Put_Line ("Shutting down engine...");
            EngineOff;
            Put_Line("Engine : " & CarSystem.PowerStatus'Image);
            Put_Line ("");


         when '3' =>
            Put_Line ("Activating Parked Mode...");
            ParkedOn;
            Put_Line("Parked Mode : ");
               Put_Line(CarSystem.Parked'Image);
               Put_Line ("");


         when '4' =>
            Put_Line ("Deactivating Parked Mode...");
            ParkedOff;
            Put_Line("Parked Mode : ");
            Put_Line(CarSystem.Parked'Image);
               Put_Line ("");


         when '5' =>
            Put_Line ("Activating Diagnostic Mode...");
            DiagnosticOn;
            Put_Line("Diagnostic Mode : ");
            Put_Line(CarSystem.Maintenance'Image);
            Put_Line ("");


         when '6' =>
            Put_Line ("Deactivating Diagnostic Mode...");
            DiagnosticOff;
            Put_Line("Diagnostic Mode : ");
            Put_Line(CarSystem.Maintenance'Image);
            Put_Line ("");


         when 'a' =>
            if CarSystem.Parked = On
            then
               Put_Line ("Car cannot accelerate when in Parked Mode");
            else
            if CarSystem.BatteryStatus < 10 then
               Put_Line ("Cannot accelerate further with less than 10% battery");
            else
               Put_Line ("Stepping on the gas...");
               SpeedUp;
               Put_Line("Current Speed : " & CarSystem.Speed'Image & "mph");
               Put_Line ("");
            end if;
            end if;



            when 'r' =>
            Put_Line ("Stepping off the gas...");
            SlowDown;
            Put_Line("Current Speed : " & CarSystem.Speed'Image & "mph");
               Put_Line ("");


            when 'u' =>
               if CarSystem.Speed = 0
                 then
            Put_Line ("Putting Gear up...");
            GearUp;
            Put_Line("Current Gear : " & CarSystem.CarGear'Image);
               Put_Line ("");
               else
                  Put_Line ("Car Speed Must be at 0mph to change gear");
                    Put_Line(" ");
               end if;

            when 'd' =>
            Put_Line ("Putting Gear Down...");
            GearDown;
            Put_Line("Current Gear : " & CarSystem.CarGear'Image);
            Put_Line ("");


            when 'm' =>
               Put_Line ("");

               --MENU
               Put_Line ("");
               Put_Line ("");
               Put_Line ("Automated Driving Assistant at the ready!");
               Put_Line ("");
               Put_Line ("Please chose a command from the following menu:");
               Put_Line ("");
               Put_Line ("GENERAL : ");
               Put_Line ("1 - Turn Car On");
               Put_Line ("2 - Turn Car Off");
               Put_Line ("3 - Turn On Parked Mode");
               Put_Line ("4 - Turn Off Parked Mode");
               Put_Line ("5 - Turn On Diagnostic Mode");
               Put_Line ("6 - Turn Off Diagnostic Mode");
               Put_Line ("c - Charge Car");
               Put_Line ("s - At Charging Station");
               Put_Line ("n - Not At Charging Station");
               Put_Line ("m - View Menu");
               Put_Line ("");

               Put_Line ("DRIVER ASSISNTANCE :");
               Put_Line ("a - Increase Speed by 10mph");
               Put_Line ("r - Decrease Speed by 10mph");
               Put_Line ("u - Gear Up");
               Put_Line ("d - Gear Down");
               Put_Line ("");

               Put_Line ("Press any other character to exit.");
               Put_Line ("");


               when 's' =>
               if CarSystem.AtChargingStation = No
               then
                  CarSystem.AtChargingStation := Yes;
                  end if;


                    when 'n' =>
                  if CarSystem.AtChargingStation = Yes
               then
                  CarSystem.AtChargingStation :=  No;
                  end if;


            when 'c' =>
               if CarSystem.AtChargingStation = No
               then
                  Put_Line("Car must be at charging station");
                     else
            Put_Line ("Car Charging...");
            ChargeCar;
               Put_Line("Charged.");
                  Put_Line ("");
               end if;


            when others =>
               exit;


         end case;
         end if;
      end loop;

   null;
end Main;
