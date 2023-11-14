extends TileMap
class_name Board

const BOARD_SIZE: int = 8

const CELL_SIZE: int = 64

const FLOOR_LAYER = 0
const TILEMAP_ID = 0

const FLOOR_TILE = Vector2i.ZERO
const EMPTY_TILE = Vector2(10,8)

var a_star_grid: AStarGrid2D

signal on_tile_change

func board_setup():
    a_star_setup()
    make_tiles()
    
    change_tile(Vector2i(0,0), false)
    
func get_camera_position() -> Vector2:
    return Vector2.ONE * (CELL_SIZE * BOARD_SIZE) * .5

func a_star_setup():
    a_star_grid = AStarGrid2D.new()
    a_star_grid.region = Rect2i(0, 0, BOARD_SIZE, BOARD_SIZE)
    a_star_grid.cell_size = Vector2i.ONE * CELL_SIZE
    
    a_star_grid.default_compute_heuristic = AStarGrid2D.HEURISTIC_EUCLIDEAN
    a_star_grid.default_estimate_heuristic = AStarGrid2D.HEURISTIC_EUCLIDEAN
    a_star_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_AT_LEAST_ONE_WALKABLE
    
    a_star_grid.update()
    
func get_a_star_path(unit: Unit) -> PackedVector2Array:
    return a_star_grid.get_id_path(unit.get_local_position(), mouse_to_local())

func change_tile(coords: Vector2i, is_solid: bool):
    set_cell(FLOOR_LAYER, coords, TILEMAP_ID, FLOOR_TILE)
    a_star_grid.set_point_solid(coords, is_solid)
    on_tile_change.emit()
    
func make_tiles():
    clear()
    for y in range(BOARD_SIZE):
        for x in range(BOARD_SIZE):
            var coords: Vector2i = Vector2i(x, y)
            change_tile(coords, false)

func mouse_to_local():
    return world_to_local(get_global_mouse_position())

func local_to_mouse():
    return local_to_world(get_global_mouse_position()) 
        
func world_to_local(vector: Vector2) -> Vector2:
    return local_to_map(to_local(vector))

func local_to_world(vector: Vector2i) -> Vector2i:
    return map_to_local(to_global(vector))

func _on_on_tile_change() -> void:
    a_star_grid.update()
    force_update()
