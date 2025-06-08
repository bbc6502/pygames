if __name__ == '__main__':

    import pygame
    import sys

    # Initialize Pygame
    pygame.init()

    # Set up the display
    width = 800
    height = 600
    screen = pygame.display.set_mode((width, height))

    # Set the window title
    pygame.display.set_caption("Animated Icon Example")

    # Create a clock to control the frame rate
    clock = pygame.time.Clock()

    # Colors
    WHITE = (255, 255, 255)
    BLUE = (0, 0, 255)

    # Animation variables
    icon_size = 50
    x = 0
    y = height // 2 - icon_size // 2

    # Main game loop
    running = True
    while running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False

        # Move the icon across the screen
        x += 1
        if x > width:
            x = 0  # Reset position to start again

        # Fill the screen with white background
        screen.fill(WHITE)

        # Draw the animated icon (a circle)
        pygame.draw.circle(screen, BLUE, (x, y), icon_size//2)

        # Update the display
        pygame.display.flip()

        # Control frame rate
        clock.tick(60)

    # Quit Pygame
    pygame.quit()
    sys.exit()
