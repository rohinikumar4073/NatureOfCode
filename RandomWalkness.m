% Random Walk Simulation with Dynamic Probabilities
% Parameters
numSteps = 5000; % Number of steps in the random walk
x = zeros(numSteps, 1); % Initialize x positions
y = zeros(numSteps, 1); % Initialize y positions

% Initialize mouse position
mouseX = 0; % Placeholder for mouse X position
mouseY = 0; % Placeholder for mouse Y position

% Random walk
[y,x] = generateSteps(numSteps,y,x, mouseX, mouseY);

% Plotting the random walk
figure;
h = plot(x(1), y(1), '-o'); % Initialize plot with the first point
title('Random Walk Simulation with Dynamic Probabilities');
xlabel('X Position');
ylabel('Y Position');
axis equal;
grid on;



% Animation loop
for step = 2:numSteps
    set(h, 'XData', x(1:step), 'YData', y(1:step)); % Update plot data
    pause(0.001); % Pause for a short duration to create animation effect
end

% Read the RGB image
rgbImage = imread("peppers.png");

% Convert the RGB image to grayscale
grayImage = im2gray(rgbImage);

% Display the grayscale image
imshow(grayImage);

% Read the RGB image
rgbImage = imread("peppers.png");

% Convert the RGB image to grayscale
grayImage = im2gray(rgbImage);

% Display the grayscale image
imshow(grayImage);
function [y,x] = generateSteps(numSteps,y,x, mouseX, mouseY)
for step = 2:numSteps
    direction = randi(8); % Randomly choose a direction (1: up, 2: down, 3: left, 4: right, 5: up-left, 6: up-right, 7: down-left, 8: down-right)
    
    % Calculate distance to mouse
    distanceToMouse = sqrt((mouseX - x(step-1))^2 + (mouseY - y(step-1))^2);
    
    % Determine if the walker should move towards the mouse
    if rand < 0.5 % 50% chance to move towards the mouse
        if distanceToMouse > 0
            % Move towards the mouse
            if abs(mouseX - x(step-1)) > abs(mouseY - y(step-1))
                if mouseX > x(step-1)
                    direction = 4; % Right
                else
                    direction = 3; % Left
                end
            else
                if mouseY > y(step-1)
                    direction = 1; % Up
                else
                    direction = 2; % Down
                end
            end
        end
    end
    
    switch direction
        case 1 % Up
            y(step) = y(step-1) + 1;
            x(step) = x(step-1);
        case 2 % Down
            y(step) = y(step-1) - 1;
            x(step) = x(step-1);
        case 3 % Left
            x(step) = x(step-1) - 1;
            y(step) = y(step-1);
        case 4 % Right
            x(step) = x(step-1) + 1;
            y(step) = y(step-1);
        case 5 % Up-Left
            y(step) = y(step-1) + 1;
            x(step) = x(step-1) - 1;
        case 6 % Up-Right
            y(step) = y(step-1) + 1;
            x(step) = x(step-1) + 1;
        case 7 % Down-Left
            y(step) = y(step-1) - 1;
            x(step) = x(step-1) - 1;
        case 8 % Down-Right
            y(step) = y(step-1) - 1;
            x(step) = x(step-1) + 1;
    end
end
end