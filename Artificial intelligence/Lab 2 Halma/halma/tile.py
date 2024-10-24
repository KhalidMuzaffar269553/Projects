


class Tile():

    # Goal constants
    T_NONE = 0
    T_white = 1
    T_black = 2

    # Piece constants
    P_NONE = 0
    P_white = 1
    P_black = 2

    # Outline constants
    O_NONE = 0
    O_SELECT = 1
    O_MOVED = 2

    def __init__(self, tile=0, piece=0, outline=0, row=0, col=0):
        self.tile = tile
        self.piece = piece
        self.outline = outline

        self.row = row
        self.col = col
        self.loc = (row, col)

    def get_tile_colors(self):

        
        tile_colors = [
            ("#A3AAAF", "#416B89"),  # Normal tiles
            ("#71b651", "#a6ce9d"),  # black goal tiles
            ("#ba6262", "#ce9d9d")   # white goal tiles
        ]
        tile_color = tile_colors[self.tile][(self.loc[0] + self.loc[1]) % 2]

        
        outline_colors = [
            tile_color,
            "yellow",  
            "#1100BB"
        ]
        outline_color = outline_colors[self.outline]

        return tile_color, outline_color

    def __str__(self):
        return chr(self.loc[1] + 97) + str(self.loc[0] + 1)

    def __repr__(self):
        return chr(self.loc[1] + 97) + str(self.loc[0] + 1)
