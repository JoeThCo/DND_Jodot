extends TileMap
class_name Board

const BOARD_SIZE: int = 8
const OFFSET: float = float(BOARD_SIZE) * .5
const BOTTOM_LEFT: Vector2i = Vector2i.ONE * -OFFSET

const CELL_SIZE: int = 64

const FLOOR_LAYER = 0
const TILEMAP_ID = 0

var a_star_grid: AStarGrid2D

signal on_tile_change

func board_setup():
    a_star_setup()
    clear()
    make_tiles()

func a_star_setup():
    a_star_grid = AStarGrid2D.new()
    a_star_grid.region = Rect2i(-OFFSET, -OFFSET, BOARD_SIZE, BOARD_SIZE)
    a_star_grid.cell_size = Vector2i.ONE * CELL_SIZE
    a_star_grid.update()
    
func get_a_star_path(unit: Unit) -> PackedVector2Array:
    return a_star_grid.get_id_path(world_to_local(unit.position), mouse_to_local())
    
func change_tile(coords: Vector2i, is_solid: bool):
    set_cell(FLOOR_LAYER, coords, TILEMAP_ID, Vector2i.ZERO)
    a_star_grid.set_point_solid(coords, is_solid)
    a_star_grid.update()
    on_tile_change.emit()
    
func make_tiles():
    for y in range(BOARD_SIZE):
        for x in range(BOARD_SIZE):
            var coords: Vector2i = Vector2i(x, y) + BOTTOM_LEFT
            change_tile(coords, false)

func mouse_to_local():
    return world_to_local(get_global_mouse_position())

func local_to_mouse():
    return local_to_world(get_global_mouse_position()) 
        
func world_to_local(vector: Vector2) -> Vector2:
    return local_to_map(to_local(vector))

func local_to_world(vector: Vector2i) -> Vector2i:
    return map_to_local(to_global(vector))
