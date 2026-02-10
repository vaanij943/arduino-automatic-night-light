% Automatic Night Light
% MATLAB graph that matches the Arduino logic (threshold = 350)

% Time in seconds
t = 0:7;

% Light sensor readings from A0 (example data)
lightValue = [700 550 320 250 150 50 0 800];

% Compute LED state using the same rule as the Arduino code
% 1 means LED on, 0 means LED off
ledState = zeros(size(lightValue));  % start with all off

for k = 1:length(lightValue)
    if lightValue(k) == 0
        ledState(k) = 0;                % LED off
    elseif lightValue(k) < 350
        ledState(k) = 1;                % LED on
    else
        ledState(k) = 0;                % LED off
    end
end

figure;

% Top graph: light sensor reading vs time
subplot(2,1,1);
plot(t, lightValue, 'o-');
xlabel('Time (seconds)');
ylabel('Light sensor value (0 to 1023)');
title('Light Sensor Reading vs Time');
grid on;
legend('A0 reading','Location','best');

% Bottom graph: LED state vs time
subplot(2,1,2);
stairs(t, ledState, 'o-');
xlabel('Time (seconds)');
ylabel('LED state (On or Off)');
yticks([0 1]);
yticklabels({'Off','On'});
title('LED State vs Time (Threshold = 350)');
grid on;
legend('LED state','Location','best');

% Overall title for the whole figure
sgtitle('Automatic Night Light Behavior');
