def fullscreen_fix(game_height):
    """ Sets full screen display mode and draws a square in the top left """
    # Set the display mode to the current screen resolution
    screen = pygame.display.set_mode((0, 0), FULLSCREEN)

    # create a square pygame surface
    game_surface = pygame.Surface((game_height, game_height))
    game_surface.fill((255, 255, 255))

    # draw a square in the top left
    pygame.draw.rect(game_surface, (0, 0, 0), Rect(10, 10, 200, 200))

    # make the largest square surface that will fit on the screen
    screen_width = screen.get_width()
    screen_height = screen.get_height()
    smallest_side = min(screen_width, screen_height)
    screen_surface = pygame.Surface((smallest_side, smallest_side))

    # scale the game surface up to the larger surface
    pygame.transform.scale(
        game_surface, # surface to be scaled
        (smallest_side, smallest_side), # scale up to (width, height)
        screen_surface) # surface that game_surface will be scaled onto

    # place the larger surface in the centre of the screen
    screen.blit(
        screen_surface,
        ((screen_width - smallest_side) // 2, # x pos
        (screen_height - smallest_side) // 2)) # y pos

    pygame.display.flip()
    wait_for_keypress()
