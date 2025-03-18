.data
    # Bitmap display configuration
    DISPLAY_WIDTH:    .word 256        # Width of the display in pixels (256x256 resolution)
    DISPLAY_HEIGHT:   .word 256        # Height of the display in pixels
    BITMAP_BASE:      .word 0x10040000 # Base address of the MIPS bitmap display memory

    # MMIO (Memory-Mapped I/O) constants
    KEYBOARD_ADDR:    .word 0xffff0004 # Memory-mapped address for keyboard input

    # Animation state variables
    animation_offset: .word 0          # Current frame offset for animation (used for wave effects)
    update_section:   .word 0          # Current section of the sea being updated (0-3 for partial updates)

    # Sea colors
    sea_light:        .word 0x0032C7D3 # Light blue color for sea reflections
    sea_highlight:    .word 0x0048D7E0 # Brightest blue color for sea highlights

    # Gradient transition properties
    GRADIENT_WIDTH:   .word 8          # Width of gradient transition zones for smooth color blending

    # Submarine properties
    sub_x:            .word 20         # Submarine's fixed x-position (horizontal position)
    sub_y:            .word 128        # Submarine's y-position (vertical position, can move up/down)
    sub_length:       .word 25         # Length of the submarine in pixels
    sub_width:        .word 11         # Width of the submarine in pixels
    sub_direction:    .word 0          # Submarine's direction: 0 = up, 2 = down
    sub_color:        .word 0xfffa00   # Yellow color for the submarine's body (RGB)
    sub_window:       .word 0x00FFFF   # Light blue color for the submarine's window

    # Performance optimization variables
    refresh_count:    .word 0          # Counter to control the refresh rate of the display
    refresh_rate:     .word 0          # Always refresh together with submarine movement
    prev_sub_y:       .word 128        # Previous y-position of the submarine (used to clear old position)

    # Submarine image data (color array)
    # Each row represents a row of pixels in the submarine's image
    # Colors are stored as 24-bit RGB values (0xRRGGBB)
    color_array:
    # Row 0 to Row 10 (11 rows total, each with 25 pixels)
    # Row 0
    .word 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x334455, 0x334455, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
    # Row 1
    .word 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xA8E4F1, 0xA8E4F1, 0xA8E4F1, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x334455, 0x334455, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
    # Row 2
    .word 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xA8E4F1, 0xA8E4F1, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0x000000, 0x334455, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
    # Row 3
    .word 0x334455, 0x000000, 0x000000, 0x000000, 0x000000, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
    # Row 4
    .word 0x334455, 0x334455, 0x000000, 0x000000, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0x334455, 0x334455, 0x334455, 0x334455, 0x334455, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
    # Row 5
    .word 0x334455, 0x334455, 0x000000, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0x334455, 0xA8E4F1, 0xA8E4F1, 0xA8E4F1, 0xA8E4F1, 0x334455, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
    # Row 6
    .word 0x334455, 0x334455, 0x000000, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0x334455, 0xA8E4F1, 0xA8E4F1, 0xA8E4F1, 0xA8E4F1, 0x334455, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
    # Row 7
    .word 0x334455, 0x334455, 0x000000, 0x000000, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0x334455, 0x334455, 0x334455, 0x334455, 0x334455, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
    # Row 8
    .word 0x334455, 0x000000, 0x000000, 0x000000, 0x000000, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
    # Row 9
    .word 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xA8E4F1, 0xA8E4F1, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0xFFFA00, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
    # Row 10
    .word 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
    # Frame rate control variables
    frame_counter: .word 0
    frame_rate:    .word 60  # Target frame rate (e.g., 60 frames per second)
    
    sub_img_width:    .word 25         # Width of the submarine image (matches sub_length)
    sub_img_height:   .word 11         # Height of the submarine image (matches sub_width)

.text
.globl main

main:
    j main_loop                        # Jump to the main animation loop

# Main animation loop
main_loop:
    # Draw the sea first, then draw the submarine on top
    jal draw_sea_partial               # Call function to draw a portion of the sea
    jal draw_sea_at_submarine          # Clear the area around the submarine's old position
    jal draw_image_submarine           # Draw the submarine at its new position

    # Update animation offset for the next frame
    lw $t0, animation_offset           # Load current animation offset
    addi $t0, $t0, 1                   # Increment offset by 1 for smoother animation
    andi $t0, $t0, 0xFF                # Keep offset within range (0-255)
    sw $t0, animation_offset           # Store updated offset

    # Update the section of the sea to draw next
    lw $t0, update_section             # Load current section
    addi $t0, $t0, 1                   # Increment section
    andi $t0, $t0, 0x3                 # Cycle through sections 0-3
    sw $t0, update_section             # Store updated section

    # Check for keyboard input to move the submarine
    jal check_keyboard                 # Call function to handle keyboard input
    
    # Frame rate control
    lw $t1, frame_counter
    addi $t1, $t1, 1
    sw $t1, frame_counter

    lw $t2, frame_rate
    blt $t1, $t2, skip_delay  # Skip delay if frame counter < frame rate

    # Reset frame counter
    li $t1, 0
    sw $t1, frame_counter

skip_delay:
    j main_loop


# ---- Function: Draw sea at submarine position (to clear old position) ----
draw_sea_at_submarine:
    # Save return address
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    # Load submarine's previous position
    lw $t0, sub_x                      # Submarine's x-position
    lw $t1, prev_sub_y                 # Submarine's previous y-position
    lw $t2, sub_length                 # Submarine's length
    lw $t3, sub_width                  # Submarine's width

    # Calculate rectangle to clear (centered on submarine's old position)
    sra $t4, $t2, 1                    # Half of submarine's length
    sra $t5, $t3, 1                    # Half of submarine's width
    sub $t0, $t0, $t4                  # Left edge of rectangle
    sub $t1, $t1, $t5                  # Top edge of rectangle

    # Add margin to the rectangle (make it slightly larger than the submarine)
    addi $t0, $t0, -2                  # Expand left edge
    addi $t1, $t1, -2                  # Expand top edge
    addi $t2, $t2, 4                   # Expand width
    addi $t3, $t3, 4                   # Expand height

    # Draw one pixel at a time with bounds checking
    li $t6, 0                          # Initialize y-counter

sea_clear_y_loop:
    bge $t6, $t3, sea_clear_done       # If y-counter >= height, exit loop
    li $t7, 0                          # Initialize x-counter

sea_clear_x_loop:
    bge $t7, $t2, sea_clear_next_y     # If x-counter >= width, move to next row

    # Calculate actual x, y coordinates
    add $a0, $t0, $t7                  # x = left + x-counter
    add $a1, $t1, $t6                  # y = top + y-counter

    # Check if x, y is within screen bounds
    bltz $a0, sea_skip_pixel           # Skip if x < 0
    bltz $a1, sea_skip_pixel           # Skip if y < 0
    lw $t8, DISPLAY_WIDTH
    bge $a0, $t8, sea_skip_pixel       # Skip if x >= display width
    lw $t8, DISPLAY_HEIGHT
    bge $a1, $t8, sea_skip_pixel       # Skip if y >= display height

    # Calculate pixel position in memory
    jal calc_position                  # Call function to calculate memory address

    # Draw sea pixel (use sea_light color)
    lw $t8, sea_light
    sw $t8, 0($v0)                     # Store color at calculated address

sea_skip_pixel:
    addi $t7, $t7, 1                   # Increment x-counter
    j sea_clear_x_loop                 # Repeat for next pixel

sea_clear_next_y:
    addi $t6, $t6, 1                   # Increment y-counter
    j sea_clear_y_loop                 # Repeat for next row

sea_clear_done:
    # Restore return address
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra                             # Return to caller

# ---- Function: Draw only 1/4 of the sea each frame for faster animation ----
draw_sea_partial:
    # Save essential registers
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $s0, 4($sp)

    # Load bitmap base and dimensions
    lw $t0, BITMAP_BASE                # Base address of bitmap display
    lw $t1, DISPLAY_WIDTH              # Width of display
    lw $t2, DISPLAY_HEIGHT             # Height of display

    # Load sea colors
    lw $s0, sea_light                  # Light sea color
    lw $t3, sea_highlight              # Highlight sea color

    # Get animation state
    lw $t9, animation_offset           # Load animation offset

    # Get section to update (0-3)
    lw $t4, update_section             # Load current section

    # Calculate row range for this section
    li $t5, 64                         # Height / 4 = 64 rows per section
    mul $t6, $t4, $t5                  # Start row = section * 64
    add $t5, $t6, $t5                  # End row = start + 64

    # Only process rows for current section
sea_row_loop:
    li $t7, 0                          # Initialize column counter (x)

sea_col_loop:
    # Default to sea_light color
    move $t8, $s0                      # Set default color to sea_light

    # Simplified wave pattern calculation
    add $a0, $t7, $t6                  # x + y
    srl $a0, $a0, 3                    # Divide by 8 for coarser pattern
    add $a0, $a0, $t9                  # Add animation offset
    andi $a0, $a0, 0x3F                # Modulo 64 to keep within range

    # Simple horizontal pattern
    srl $a1, $t7, 2                    # x / 4
    add $a1, $a1, $t9                  # Add animation offset
    andi $a1, $a1, 0x3F                # Modulo 64

    # Simple binary decision for most pixels
    add $a3, $a0, $a1                  # Combine x and y patterns
    andi $a3, $a3, 0x3F                # Modulo 64
    slti $k0, $a3, 32                  # Check if value < 32
    beqz $k0, use_light                # If not, use light color

    # Check if gradient is needed
    slti $k0, $a3, 4                   # Check if value < 4
    bnez $k0, light_to_highlight_gradient # If yes, apply gradient
    slti $k0, $a3, 28                  # Check if value < 28
    beqz $k0, highlight_to_light_gradient # If yes, apply gradient

    # Core highlight region
    move $t8, $t3                      # Use highlight color
    j store_pixel                      # Jump to store pixel

use_light:
    # Use light color directly
    move $t8, $s0                      # Set color to sea_light
    j store_pixel                      # Jump to store pixel

light_to_highlight_gradient:
    # Simple 50/50 blend of light and highlight colors
    srl $a0, $s0, 16                   # Extract R component of light color
    andi $a0, $a0, 0xFF
    srl $k1, $t3, 16                   # Extract R component of highlight color
    andi $k1, $k1, 0xFF
    add $a0, $a0, $k1                  # Sum R components
    srl $a0, $a0, 1                    # Divide by 2 (average)
    sll $a0, $a0, 16                   # Shift back to R position

    # Extract G components
    srl $v0, $s0, 8                    # Extract G component of light color
    andi $v0, $v0, 0xFF
    srl $k1, $t3, 8                    # Extract G component of highlight color
    andi $k1, $k1, 0xFF
    add $v0, $v0, $k1                  # Sum G components
    srl $v0, $v0, 1                    # Divide by 2 (average)
    sll $v0, $v0, 8                    # Shift back to G position

    # Extract B components
    move $v1, $s0                      # Extract B component of light color
    andi $v1, $v1, 0xFF
    move $k1, $t3                      # Extract B component of highlight color
    andi $k1, $k1, 0xFF
    add $v1, $v1, $k1                  # Sum B components
    srl $v1, $v1, 1                    # Divide by 2 (average)

    # Combine RGB components
    or $t8, $a0, $v0                   # Combine R and G
    or $t8, $t8, $v1                   # Combine with B
    j store_pixel                      # Jump to store pixel

highlight_to_light_gradient:
    # Same as light_to_highlight_gradient
    j light_to_highlight_gradient      # Jump to gradient calculation

store_pixel:
    # Calculate pixel address
    mul $a0, $t6, $t1                  # y * width
    add $a0, $a0, $t7                  # y * width + x
    sll $a0, $a0, 2                    # Multiply by 4 (bytes per pixel)
    add $a0, $a0, $t0                  # Add base address
    sw $t8, 0($a0)                     # Store color at calculated address

    # Optimization: Draw 2x2 pixel blocks
    add $a0, $a0, 4                    # Move to next pixel to the right
    sw $t8, 0($a0)                     # Store same color

    # Next column (skip one for 2x2 blocks)
    addi $t7, $t7, 2                   # Increment x-counter by 2
    blt $t7, $t1, sea_col_loop         # Repeat for next column

    # Next row (skip one for 2x2 blocks)
    addi $t6, $t6, 1                   # Increment y-counter by 1
    blt $t6, $t5, sea_row_loop         # Repeat for next row

    # Restore registers
    lw $s0, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 8
    jr $ra                             # Return to caller

# ---- Function: Calculate display position ----
calc_position:
    # Get display base address
    lw $v0, BITMAP_BASE                # Load base address of bitmap display
    lw $t0, DISPLAY_WIDTH              # Load display width

    # Calculate position = base + 4 * (y * width + x)
    mul $t1, $a1, $t0                  # t1 = y * width
    add $t1, $t1, $a0                  # t1 = y * width + x
    sll $t1, $t1, 2                    # t1 = 4 * (y * width + x)
    add $v0, $v0, $t1                  # v0 = base + offset

    jr $ra                             # Return to caller

# ---- Function: Draw submarine image at current position ----
draw_image_submarine:
    # Save return address and registers
    addi $sp, $sp, -16
    sw $ra, 0($sp)
    sw $s0, 4($sp)
    sw $s1, 8($sp)
    sw $s2, 12($sp)

    # Load submarine position
    lw $s0, sub_x                      # Load submarine's x-position
    lw $s1, sub_y                      # Load submarine's y-position

    # Load image dimensions
    lw $s2, sub_img_width              # Load submarine image width
    lw $s3, sub_img_height             # Load submarine image height

    # Calculate top-left corner of image
    sra $t0, $s2, 1                    # Half width
    sra $t1, $s3, 1                    # Half height
    sub $s0, $s0, $t0                  # Adjust x to center
    sub $s1, $s1, $t1                  # Adjust y to center

    # Check submarine direction (0 = up, 2 = down)
    lw $t2, sub_direction              # Load submarine direction

    # Draw the image
    li $t3, 0                          # Initialize row counter (y)

image_row_loop:
    beq $t3, $s3, image_done           # If row counter >= height, exit loop
    li $t4, 0                          # Initialize column counter (x)

    # If submarine is pointing down, invert the row index
    move $t9, $t3                      # Default row index
    beq $t2, 0, normal_direction       # If direction is up, skip inversion

    # For downward direction, invert the row
    sub $t9, $s3, $t3                  # Invert row index
    addi $t9, $t9, -1                  # Adjust for zero-based indexing

normal_direction:
    # Calculate base index into color array for this row
    mul $t5, $t9, $s2                  # row * width
    la $t6, color_array                # Load address of color array
    sll $t5, $t5, 2                    # Convert to byte offset (4 bytes per word)
    add $t6, $t6, $t5                  # Address of start of row in color array

image_col_loop:
    beq $t4, $s2, next_image_row       # If column counter >= width, move to next row

    # Load color from array
    sll $t5, $t4, 2                    # Convert column to byte offset
    add $t7, $t6, $t5                  # Address of color
    lw $t8, 0($t7)                     # Load color

    # Skip drawing if color is 0x000000 (transparent)
    beqz $t8, skip_pixel               # If color is transparent, skip

    # Calculate screen position
    add $a0, $s0, $t4                  # x = left + x-counter
    add $a1, $s1, $t3                  # y = top + y-counter

    # Check if pixel is within screen bounds
    bltz $a0, skip_pixel               # Skip if x < 0
    bltz $a1, skip_pixel               # Skip if y < 0
    lw $t7, DISPLAY_WIDTH
    bge $a0, $t7, skip_pixel           # Skip if x >= display width
    lw $t7, DISPLAY_HEIGHT
    bge $a1, $t7, skip_pixel           # Skip if y >= display height

    # Draw pixel
    jal calc_position                  # Calculate memory address
    sw $t8, 0($v0)                     # Store pixel color

skip_pixel:
    addi $t4, $t4, 1                   # Increment column counter
    j image_col_loop                   # Repeat for next column

next_image_row:
    addi $t3, $t3, 1                   # Increment row counter
    j image_row_loop                   # Repeat for next row

image_done:
    # Restore registers and return
    lw $s2, 12($sp)
    lw $s1, 8($sp)
    lw $s0, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 16
    jr $ra                             # Return to caller

# ---- Function: Check keyboard for input ----
check_keyboard:
    lw $t3, sub_y                      # Load submarine's current y-position
    sw $t3, prev_sub_y                 # Store current y-position as previous

    # Save return address
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    # Get keyboard ready bit address (control register)
    lw $t0, KEYBOARD_ADDR
    addi $t0, $t0, -4                  # Keyboard control is 4 bytes before data

    # Check if a key is ready
    lw $t1, 0($t0)                     # Load control value
    andi $t1, $t1, 1                   # Check ready bit
    beqz $t1, check_done               # If not ready, exit

    # Get keyboard data address
    lw $t0, KEYBOARD_ADDR

    # Read character from keyboard
    lw $t1, 0($t0)                     # Read full word instead of byte
    andi $t1, $t1, 0xFF                # Keep only the lowest byte

    # Get submarine's current position
    lw $t2, sub_x                      # Load submarine's x-position
    lw $t3, sub_y                      # Load submarine's y-position
    lw $t5, DISPLAY_HEIGHT             # Load display height
    lw $t7, sub_length                 # Load submarine's length

    # Check for 'w' - move up
    li $t9, 'w'                        # ASCII code for 'w'
    bne $t1, $t9, not_up               # If key is not 'w', skip
    li $t4, 0                          # Set direction to up
    sw $t4, sub_direction              # Store direction
    addi $t3, $t3, -6                  # Move submarine up by 6 pixels
    blt $t3, 0, reset_position         # If y < 0, reset position
    j update_position                  # Update position

not_up:
    # Check for 's' - move down
    li $t9, 's'                        # ASCII code for 's'
    bne $t1, $t9, check_done           # If key is not 's', exit
    li $t4, 2                          # Set direction to down
    sw $t4, sub_direction              # Store direction
    addi $t3, $t3, 6                   # Move submarine down by 6 pixels
    add $t8, $t3, $t7                  # Calculate bottom edge of submarine
    bge $t8, $t5, reset_position       # If bottom edge >= display height, reset position
    j update_position                  # Update position

reset_position:
    # Reset position to previous valid position
    lw $t3, sub_y                      # Load previous y-position

update_position:
    # Update submarine's y-position
    sw $t3, sub_y                      # Store new y-position

check_done:
    # Restore return address
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra                             # Return to caller

