% MATLAB script to plot real-time data from Arduino (Updated)
%
% This script reads data from the serial port and plots it in real-time.
% It uses the newer 'serialport' interface for better compatibility.

% --- Instructions ---
% 1. Upload the LDR_Project.ino sketch to your Arduino.
% 2. Run the following command in the MATLAB command window to see available ports:
%    >> serialportlist("available")
% 3. Replace '/dev/ttyACM0' below with the correct port from the list.

% --- Configuration ---
serialPort = "COM4" ; % <-- CHANGE THIS to your Arduino's port
baudRate = 9600;

% --- Setup ---
% Create a serial port object
s = serialport(serialPort, baudRate);

% --- Real-time Plotting ---
try    
    % Create a figure for the plot
    figure;
    h = animatedline;
    ax = gca;
    ax.YGrid = 'on';
    title('Real-time LDR Sensor Readings');
    xlabel('Time (s)');
    ylabel('Light Value (0-1023)');
    
    % Read and plot data in a loop
    startTime = tic;
    while ishandle(h)
        % Read a line of data from the Arduino
        dataStr = readline(s);
        
        % Convert the data to a number and remove any whitespace
        data = str2double(strtrim(dataStr));
        
        % Get the current time
        t = toc(startTime);
        
        % Add the new data point to the plot
        if ~isnan(data)
            addpoints(h, t, data);
            
            % Adjust the x-axis limits to show the last 50 seconds
            if t > 50
                xlim(ax, [t-50, t]);
            end
            
            % Redraw the plot
            drawnow;
        end
    end
    
catch e
    % In case of an error, display a helpful message
    disp('Error: Could not read from serial port or plot data.');
    disp('Please check the following:');
    disp('1. Is the Arduino connected to the computer?');
    disp(['2. Is ''', serialPort, ''' the correct port name? Run "serialportlist(""available"")" to check.']);
    disp('3. Is the Arduino IDE''s Serial Monitor closed? (Only one program can use the port at a time).');
    disp(['MATLAB Error Message: ', e.message]);
end

% --- Cleanup ---
% The serialport object is automatically cleared when it goes out of scope
% or when the script ends.
clear s;
disp('Plot window closed. Serial connection terminated.');