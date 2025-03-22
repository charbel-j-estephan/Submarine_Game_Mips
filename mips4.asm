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
color_array: .word 
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x3f7f7f, 0x425265, 0x415163, 0x3f5062, 0x7f7f7f, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x515c73, 0x3d4c60, 0x3e5064, 0x404f62, 0x55557f
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x48556d, 0x3c4d61, 0x455362, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x002a2a, 0x37475a, 0x323f50
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xcae4ed, 0x7890a0
0x9fbcc6, 0xc7e8f2, 0xc9eaf2, 0xd0e7f3, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xd0e7e7, 0xc4e6f0
0xcbf2fb, 0xc9eff9, 0xcaf1fa, 0xd0f8ff, 0xbde3ef, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x83cae4, 0x7bc5e3, 0xbfbfbf, 0x000000, 0x000000, 0xc9e8f2
0xc9eff9, 0xc2e7f1, 0xc2e7f1, 0xc1e7f2, 0xc3eaf6, 0xb5e1f2, 0xb4e9ff, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x7dc5e2, 0x78d1f4, 0x6ebedc, 0x000000, 0x000000
0xc2e8f8, 0xc8f1ff, 0xc1e8f4, 0xc4e7eb, 0xc7e5e2, 0xcae4dd, 0xccebe8, 0xcae2da
0x000002, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x445664, 0x445262, 0x000000, 0x000000, 0x7dc6e2, 0x73c9ec, 0x66bde1, 0x45c5ff
0xffff9f, 0xd5deba, 0xe4dc96, 0xebcf69, 0xf2c74e, 0xf6c341, 0xf8c43d, 0xf9c641
0xf8c942, 0xfdcc3e, 0x807a59, 0x666b66, 0x000001, 0x000000, 0x000000, 0x000000
0x000000, 0x404f61, 0x3d4d60, 0x556371, 0x000000, 0x7cc5e4, 0x6cc4ea, 0x73c9e9
0xb9c68d, 0xffc934, 0xfec933, 0xffc62a, 0xffc52c, 0xffc52d, 0xfec42e, 0xffc630
0xffc62f, 0xffc930, 0xffcb35, 0x5a615c, 0xa28f4b, 0xffd23b, 0xf9c953, 0x000000
0x000000, 0x000000, 0x3f5062, 0x3e5064, 0x475364, 0x000000, 0x5bc8ff, 0x94c4b8
0xdec85d, 0xffcd34, 0xffcb32, 0xffc731, 0xffca31, 0xffca30, 0xffca30, 0xffcb31
0xffc732, 0xffc732, 0xffc931, 0xebbb38, 0x46525c, 0xcba73f, 0xffd332, 0xfbc636
0xf3c349, 0x000000, 0x000000, 0x435163, 0x3e5064, 0x415064, 0x000000, 0xf6cb47
0xfbcb36, 0xffc82d, 0xffc732, 0xffc732, 0xffcb31, 0xd0a938, 0x8a8051, 0x867f57
0xbd9d3d, 0xffc931, 0xffc732, 0xffca31, 0xd8b03c, 0x45525c, 0xe2b739, 0xffc931
0xffcb32, 0xfac133, 0xf2c84e, 0x000000, 0x515c68, 0x3c4d60, 0x32486a, 0xffd33f
0xffcf35, 0xffc831, 0xffc732, 0xffc732, 0xffcb31, 0xc7a43b, 0x6c818b, 0xa7cbde
0xafd4e5, 0x7a97a8, 0xaa9245, 0xffca31, 0xffcb31, 0xc8a53e, 0x45535c, 0xebbc37
0xffc931, 0xffc732, 0xffce33, 0xf9c439, 0xffffff, 0x000000, 0x384a61, 0x8d8459
0xffcc33, 0xffc932, 0xffc732, 0xffc732, 0xffc832, 0xf9c430, 0x797d68, 0xb5dbeb
0xc7ecf5, 0xc5eaf3, 0xc5ebf7, 0x7a8c8e, 0xe7b732, 0xffcd30, 0xbd9f41, 0x44525b
0xedbc36, 0xffc931, 0xffc732, 0xffc932, 0xfdc835, 0xf8d057, 0x000000, 0x324666
0xbea148, 0xffce31, 0xffc732, 0xffc732, 0xffc732, 0xffc931, 0xe2b332, 0x798f95
0xc6edf7, 0xc2e7f0, 0xc2e7f0, 0xc7edf6, 0x91b0c0, 0xc4a13a, 0xffcf2f, 0xbc9d43
0x43515c, 0xebbb37, 0xffc931, 0xffc732, 0xffc732, 0xffca34, 0xf8ca43, 0x000000
0x324866, 0xc2a347, 0xffcc31, 0xffc732, 0xffc732, 0xffc732, 0xffc931, 0xe2b333
0x788d94, 0xc6edf7, 0xc2e7f0, 0xc2e7f0, 0xc7edf6, 0x8fafc0, 0xc2a03a, 0xffcf2f
0xc3a240, 0x3f4f5e, 0xe5b839, 0xffc931, 0xffc732, 0xffc732, 0xffcb34, 0xfccb41
0x000000, 0x344862, 0x978852, 0xffcd31, 0xffc732, 0xffc732, 0xffc732, 0xffc832
0xf8c331, 0x747968, 0xb5daea, 0xc7edf5, 0xc5eaf3, 0xc5ebf7, 0x75888c, 0xe5b533
0xffcc30, 0xd1ab3e, 0x3d4d5e, 0xd9b13b, 0xffca31, 0xffc732, 0xffc832, 0xfdc734
0xfac945, 0x485b6d, 0x3a4a61, 0x4e5a60, 0xffce37, 0xffcc33, 0xffc732, 0xffc732
0xffc732, 0xffcb31, 0xc09f3c, 0x657b89, 0xa4c8db, 0xadd1e3, 0x7491a5, 0xa18d46
0xffcb31, 0xffca31, 0xe0b539, 0x3e4e5d, 0xc9a63f, 0xffcb31, 0xffc732, 0xffca32
0xfdc836, 0xffd65d, 0x4f6072, 0x3c4d60, 0x364964, 0xffd74a, 0xfcc834, 0xffc931
0xffc732, 0xffc732, 0xffc732, 0xffcb31, 0xc8a43a, 0x7e7854, 0x7a7759, 0xb3973f
0xfec832, 0xffc832, 0xffc831, 0xf0be36, 0x46525c, 0xb09745, 0xffcc30, 0xffc732
0xffd135, 0xfbc83f, 0x000000, 0x4d586e, 0x3c4c61, 0x3e4e61, 0x000000, 0xf9c643
0xffc52f, 0xffc52c, 0xffc732, 0xffc732, 0xffc732, 0xffcb31, 0xffca31, 0xffc931
0xffcb31, 0xffc732, 0xffc732, 0xffc832, 0xfcc633, 0x575e58, 0x92834b, 0xffcc31
0xffd034, 0xfcc939, 0xffd463, 0x000000, 0x555555, 0x3f4e61, 0x415163, 0x000000
0x000005, 0xa4c5a5, 0xeac44c, 0xffc329, 0xffca31, 0xffc832, 0xffc732, 0xffc732
0xffc732, 0xffc732, 0xffc732, 0xffc732, 0xffc732, 0xffcb31, 0x736f52, 0x6e6d55
0xffd335, 0xfdca3b, 0xf6cd52, 0x000000, 0x000000, 0x000000, 0x55616d, 0x555571
0x000000, 0x91c8ec, 0x6ec4eb, 0x7dc9de, 0xb3c490, 0xf7c53a, 0xfdc833, 0xffcf35
0xffcf34, 0xffcd33, 0xffcc33, 0xffcb33, 0xffcc33, 0xffcd33, 0xffd432, 0xa08e4c
0x4b575f, 0xecc246, 0xffd46a, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x84c6e2, 0x72c4e5, 0x6ccbf1, 0x68c0ec, 0xcce5b2, 0xf9c94a
0xf9cc44, 0xfdca3f, 0xfdc93b, 0xfcc839, 0xfdc838, 0xfcc839, 0xfdca3a, 0xfdcd3e
0xccac4f, 0x2e4573, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x7fc7df, 0x72c3e5, 0x6cbfdf, 0x94bfd4, 0x000000
0x000000, 0x000000, 0x000000, 0x000001, 0xbfbfbf, 0xffda91, 0xffffff, 0x000001
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x89c4d7, 0x7bc4e1, 0x8cbfd8, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000
    # Frame rate control variables
    frame_counter: .word 0
    frame_rate:    .word 60  # Target frame rate (e.g., 60 frames per second)
    
    sub_img_width:    .word 25         # Width of the submarine image (matches sub_length)
    sub_img_height:   .word 25         # Height of the submarine image (matches sub_width)
    
    shark_color_array:
    .word 
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x152639, 0x182131, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x1f2b3e, 0x3e93c1, 0x4299c9, 0x2f6485
0x17232f, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x1c5677, 0x40b3f0, 0x47b7f2
0x4abaf5, 0x4096c5, 0x29506c, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x427c9a, 0x49acdb
0x2097d1, 0x269ad7, 0x2ea4e0, 0x3aa6e1, 0x30698b, 0x0e070e, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x1f1a25, 0xcbced4
0xf8fdfe, 0x9acee6, 0x1a8ec8, 0x128bca, 0x1690cd, 0x2ba6e2, 0x2d6b92, 0x0f0000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x4e4e55
0xe3e7ec, 0xf9fdff, 0xfefeff, 0xa2d4e9, 0x188dc9, 0x1590cf, 0x146894, 0x2e739a
0x254e6a, 0x26485d, 0x214963, 0x1f3851, 0x171b2c, 0x0b0000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x736e78, 0xf7fdff, 0xfaffff, 0xfbffff, 0xfdffff, 0x89c7e5, 0x118ac8, 0x0f2129
0x444d54, 0x247aa8, 0x3c8ab4, 0x4ab4eb, 0x44a7dd, 0x3892c6, 0x2c6b90, 0x1a2a37
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x605b62, 0x908d8f, 0x979c9e, 0xb2b7bb, 0xe6ebed, 0xfcffff, 0x76bee2
0x095074, 0x0e4865, 0x168fcc, 0x217096, 0x2693cc, 0x1b94d3, 0x1a96d5, 0x1e8bc5
0x152d3e, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x4f4c52, 0x6d2525, 0x743838, 0x581d1d, 0x83797a, 0xadafb0
0xe5eaed, 0x85cbe9, 0x289cd6, 0x1890cf, 0x177db5, 0x1472a2, 0x1590d0, 0x1891d0
0x144e74, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x6e0203, 0x990000, 0x960000, 0x8a5557
0x5a2929, 0x6e6060, 0xa49ea0, 0xa3acb0, 0x73b9dc, 0x108bcc, 0x176d9b, 0x1791cf
0x17618d, 0x0f070f, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x5f0309, 0xa00102, 0x9a0101
0x6c0000, 0x630000, 0x590503, 0x5a2122, 0x814643, 0x8dcae6, 0x0d8dcd, 0x1880b7
0x155f88, 0x111c33, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x47090c, 0x950202
0x7c0000, 0x661513, 0x802628, 0x812726, 0x610c0b, 0x986e6f, 0x92d0ec, 0x0e87c7
0x1790cc, 0x164d72, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x3f040e
0x6e0808, 0xaa3f3f, 0xf06564, 0xff6b6b, 0xff6d6c, 0xd25754, 0xcbbfbf, 0x9cd4f0
0x0d78b0, 0x157baf, 0x1887c3, 0x175480, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x0a0005, 0xa24142, 0xff6d6a, 0xff6966, 0xe5605e, 0xcb5252, 0x8c6867, 0xf5f7f8
0xa8daf0, 0x0e6a98, 0x165f88, 0x1790cd, 0x1981b8, 0x173f6b, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x614049, 0xdc5d5b, 0xfa6663, 0xf96461, 0xb15755, 0x776767, 0xcdd3d4
0xfeffff, 0xc1dfeb, 0x166188, 0x156089, 0x178cc8, 0x1894d3, 0x1977ae, 0x152b4b
0x0e0000, 0x17000b, 0x000000, 0x000000, 0x000000, 0x000000, 0x0c0000, 0x000000
0x000000, 0x000000, 0x635c5d, 0x7f6665, 0x8b504f, 0x865354, 0x7d6e6f, 0xd1dadc
0xf9ffff, 0xf8fcff, 0xe0eef4, 0x2b88b9, 0x1483bd, 0x1790cd, 0x168ecb, 0x1893d1
0x166d9c, 0x2d6387, 0x286285, 0x000000, 0x000000, 0x29455f, 0x28709b, 0x194c6a
0x090909, 0x000000, 0x000000, 0x77737d, 0xe4eaed, 0xd1dadb, 0xd8e2e5, 0xf4feff
0xf7ffff, 0xf3f8fe, 0xf5fdfe, 0xd5e0e5, 0x2f8fc1, 0x1b94d2, 0x168ac5, 0x158fce
0x158ecd, 0x1692d0, 0x2087bd, 0x206187, 0x27354e, 0x316a8c, 0x2d98cf, 0x1c92d1
0x134568, 0x000000, 0x000000, 0x000000, 0x000000, 0x9d9ea4, 0xf5ffff, 0xe2f0f7
0xd4e5ef, 0xcde0ec, 0xcbdeea, 0xcfe1ed, 0xa7bac7, 0x2e8fc2, 0x30a4e0, 0x136ea0
0x0b7dba, 0x0f87c7, 0x0e8ccb, 0x0c8ccd, 0x178fca, 0x2d8dc2, 0x2d9ad3, 0x1896d6
0x16628f, 0x190000, 0x000000, 0x000000, 0x000000, 0x000000, 0x1b161b, 0x757f8a
0xc1d4e1, 0xc7dfee, 0xc2dbe9, 0xc0d9e6, 0xc5dceb, 0x9db3c0, 0x2988ba, 0x3bb0ec
0x1c729f, 0x5c97b6, 0x5ba4cb, 0x5caed6, 0x6bbae2, 0x52aedb, 0x1b92ce, 0x1492d2
0x1875a9, 0x132c46, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x00000a
0x10527a, 0x37627d, 0x8698a2, 0xb3c7d3, 0xc3d9e7, 0xcbe1ef, 0xafc3cd, 0x2b80ae
0x40b3f1, 0x1e7dac, 0x859097, 0x949da6, 0x8d96a1, 0x91949b, 0x8d8a8d, 0x1e6590
0x1798d9, 0x166a9c, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x17070f, 0x116a9b, 0x046191, 0x06111f, 0x373139, 0x52555e, 0x61666f, 0x5b5e62
0x1d5f82, 0x3fb5f4, 0x2385ba, 0x030f1e, 0x000000, 0x000000, 0x000000, 0x000000
0x12375a, 0x1a8eca, 0x176b9c, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x190000, 0x0f5780, 0x0d4263, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x103552, 0x35a3dc, 0x2d95cc, 0x0c273d, 0x000000, 0x000000, 0x000000
0x000000, 0x1c0000, 0x195f8a, 0x176d9b, 0x150015, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x132437, 0x15192b, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x0b0000, 0x216088, 0x2f9ad4, 0x122a42, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x0e152b, 0x163f5c, 0x19192a, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x141429, 0x1c4b6c, 0x17293a, 0x000000
0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x240000, 0x1e0f1e, 0x000000
0x000000
    # shark properties
    shark_x:            .word 256         # Starting x position (right edge)
    shark_y:            .word 240         # Fixed y position
    shark_prev_x:       .word 256         # Previous x position
    shark_width:        .word 25          # Width of the shark
    shark_height:       .word 24          # Height of the shark
    # Add this to your existing data section
    RAND_MAX:        .word 256         # Maximum random value (display height)
    RAND_MIN:        .word 180         # Minimum random value for y (to keep sharks in lower part)
    rand_seed:       .word 12345       # Random seed
    rand_mult:       .word 1103515245  # Multiplier for linear congruential generator
    rand_inc:        .word 12345       # Increment for LCG
    rand_mod:        .word 65536       # Modulus (2^16)
    shark_y_min:      .word 150         # Minimum y-coordinate for sharks
    shark_y_range:    .word 80          # Range of possible y values

    nb_lifes: .word 3
    collision_msg: .asciiz "Collision detected! You have lost a life. Continue?"
    game_over_msg: .asciiz "Game Over! You've lost all your lives. Play again?"

.text


# Main animation loop
main:
    # Draw the sea and submarine
    jal draw_sea_partial               # Draw a portion of the sea each frame
    jal draw_sea_at_submarine          # Clear submarine's old position
    jal move_shark                      # Move the shark obstacle from right to left
    jal draw_shark                      # Draw the shark at its new position
    jal draw_image_submarine           # Draw the submarine at its current position

    # Update animation state
    lw $t0, animation_offset           # Load current animation offset
    addi $t0, $t0, 1                   # Increment offset by 1
    andi $t0, $t0, 0xFF                # Keep offset within 0-255 range
    sw $t0, animation_offset           # Store updated offset

    # Update the section of sea to redraw next frame
    lw $t0, update_section             # Load current section
    addi $t0, $t0, 1                   # Increment section
    andi $t0, $t0, 0x3                 # Cycle through sections 0-3
    sw $t0, update_section             # Store updated section

    # Check for input and collisions
    jal check_keyboard                 # Handle keyboard input for submarine movement
    jal check_collision                # Check if submarine hit a shark

    # Frame rate control
    lw $t1, frame_counter              # Load current frame counter
    addi $t1, $t1, 1                   # Increment counter
    sw $t1, frame_counter              # Store updated counter

    lw $t2, frame_rate                 # Load target frame rate
    slt $t3, $t1, $t2                  # Set $t3=1 if counter < frame rate
    beq $t3, $zero, reset_counter      # If $t3=0 (counter >= rate), reset counter
    j skip_delay                       # Skip delay if counter < frame rate

reset_counter:
    # Reset frame counter when we reach target rate
    li $t1, 0                          # Reset counter to 0
    sw $t1, frame_counter              # Store reset counter

skip_delay:
    j main                        # Loop back to start of main loop
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
    srl $t4, $t2, 1                    # Half of submarine's length (right shift by 1)
    srl $t5, $t3, 1                    # Half of submarine's width (right shift by 1)
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
    slt $t9, $t6, $t3                  # Set $t9=1 if y-counter < height
    beq $t9, $zero, sea_clear_done     # If $t9=0 (y-counter >= height), exit loop
    li $t7, 0                          # Initialize x-counter

sea_clear_x_loop:
    slt $t9, $t7, $t2                  # Set $t9=1 if x-counter < width
    beq $t9, $zero, sea_clear_next_y   # If $t9=0 (x-counter >= width), move to next row

    # Calculate actual x, y coordinates
    add $a0, $t0, $t7                  # x = left + x-counter
    add $a1, $t1, $t6                  # y = top + y-counter

    # Check if x, y is within screen bounds
    slti $t9, $a0, 0                   # Set $t9=1 if x < 0
    bne $t9, $zero, sea_skip_pixel     # Skip if x < 0
    slti $t9, $a1, 0                   # Set $t9=1 if y < 0
    bne $t9, $zero, sea_skip_pixel     # Skip if y < 0
    
    lw $t8, DISPLAY_WIDTH
    slt $t9, $a0, $t8                  # Set $t9=1 if x < display width
    beq $t9, $zero, sea_skip_pixel     # Skip if x >= display width
    
    lw $t8, DISPLAY_HEIGHT
    slt $t9, $a1, $t8                  # Set $t9=1 if y < display height
    beq $t9, $zero, sea_skip_pixel     # Skip if y >= display height

    # Get animation state for wave pattern
    lw $t9, animation_offset           # Load animation offset

    # Calculate pixel position in memory
    jal calc_position                  # Call function to calculate memory address

    # Calculate wave pattern (same as in draw_sea_partial)
    add $a2, $a0, $a1                  # x + y
    srl $a2, $a2, 3                    # Divide by 8 for coarser pattern
    add $a2, $a2, $t9                  # Add animation offset
    andi $a2, $a2, 0x3F                # Modulo 64 to keep within range

    # Simple horizontal pattern
    srl $a3, $a0, 2                    # x / 4
    add $a3, $a3, $t9                  # Add animation offset
    andi $a3, $a3, 0x3F                # Modulo 64

    # Simple binary decision for most pixels
    add $k0, $a2, $a3                  # Combine x and y patterns
    andi $k0, $k0, 0x3F                # Modulo 64
    slti $k1, $k0, 32                  # Check if value < 32

    # Load sea colors
    lw $t8, sea_light                  # Light sea color
    lw $k0, sea_highlight              # Highlight sea color

    # Choose color based on pattern
    beq $k1, $zero, use_light_sea      # If $k1=0 (value >= 32), use light color
    add $t8,$zero , $k0                      # Use highlight color

use_light_sea:
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
    add $t8, $s0, $zero                # Set default color to sea_light (instead of move)

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
    
    # Replace beqz with explicit compare
    beq $k0, $zero, use_light          # If $k0=0 (value >= 32), use light color

    # Check if gradient is needed
    slti $k0, $a3, 4                   # Check if value < 4
    
    # Replace bnez with explicit compare
    bne $k0, $zero, light_to_highlight_gradient # If $k0=1 (value < 4), apply gradient
    
    slti $k0, $a3, 28                  # Check if value < 28
    
    # Replace beqz with explicit compare
    beq $k0, $zero, highlight_to_light_gradient # If $k0=0 (value >= 28), apply gradient

    # Core highlight region
    add $t8, $t3, $zero                # Use highlight color (instead of move)
    j store_pixel                      # Jump to store pixel

use_light:
    # Use light color directly
    add $t8, $s0, $zero                # Set color to sea_light (instead of move)
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
    add $v1, $s0, $zero                # Extract B component of light color (instead of move)
    andi $v1, $v1, 0xFF
    add $k1, $t3, $zero                # Extract B component of highlight color (instead of move)
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
    
    # Replace blt with slt + beq
    slt $k0, $t7, $t1                  # Set $k0=1 if x < width
    bne $k0, $zero, sea_col_loop       # If $k0=1 (x < width), repeat for next column

    # Next row (skip one for 2x2 blocks)
    addi $t6, $t6, 1                   # Increment y-counter by 1
    
    # Replace blt with slt + beq
    slt $k0, $t6, $t5                  # Set $k0=1 if y < end_row
    bne $k0, $zero, sea_row_loop       # If $k0=1 (y < end_row), repeat for next row

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

    # Load submarine position and image dimensions
    lw $s0, sub_x                      # Load submarine's x-position
    lw $s1, sub_y                      # Load submarine's y-position
    lw $s2, sub_img_width              # Load submarine image width
    lw $s3, sub_img_height             # Load submarine image height
    lw $t2, sub_direction              # Load submarine direction

    # Calculate top-left corner of image
    li $t0, 2                          # Divisor for integer division
    div $s2, $t0                       # Divide width by 2
    mflo $t0                           # Get quotient in $t0 (half width)
    div $s3, $t0                       # Divide height by 2
    mflo $t1                           # Get quotient in $t1 (half height)
    sub $s0, $s0, $t0                  # Adjust x to center
    sub $s1, $s1, $t1                  # Adjust y to center

    # Draw the image
    li $t3, 0                          # Initialize row counter (y)

image_row_loop:
    # Check if we've drawn all rows
    beq $t3, $s3, image_done           # If row counter == height, exit loop

    # Handle row index based on direction
    add $t9, $zero, $t3                # Copy t3 to t9 (replaces move)
    
    # If direction is down (2), invert the row index
    li $t5, 2                          # Load constant 2
    bne $t2, $t5, normal_direction     # If direction != 2, skip inversion
    
    # Invert row for downward direction
    sub $t9, $s3, $t3                  # Invert: use (height - current_row)
    addi $t9, $t9, -1                  # Adjust for zero-based indexing
    
normal_direction:
    # Calculate base address for this row in color array
    mul $t5, $t9, $s2                  # row * width
    sll $t5, $t5, 2                    # Convert to byte offset (4 bytes per word)
    la $t6, color_array                # Load address of color array
    add $t6, $t6, $t5                  # Address of start of row in color array
    
    # Reset column counter
    li $t4, 0                          # Initialize column counter (x)

image_col_loop:
    # Check if we've drawn all columns
    beq $t4, $s2, next_image_row       # If column counter == width, move to next row

    # Load color from array
    sll $t5, $t4, 2                    # Convert column to byte offset
    add $t7, $t6, $t5                  # Address of color
    lw $t8, 0($t7)                     # Load color

    # Skip transparent pixels (color = 0)
    li $t5, 0                          # Load constant 0
    beq $t8, $t5, skip_pixel           # If color == 0, skip

    # Calculate screen position
    add $a0, $s0, $t4                  # x = left + x-counter
    add $a1, $s1, $t3                  # y = top + y-counter

    # Check if pixel is within screen bounds (x >= 0)
    li $t5, 0                          # Load constant 0
    slt $t7, $a0, $t5                  # t7 = 1 if x < 0, else 0
    bne $t7, $zero, skip_pixel         # Skip if x < 0 (t7 != 0)
    
    # Check if y >= 0
    slt $t7, $a1, $t5                  # t7 = 1 if y < 0, else 0
    bne $t7, $zero, skip_pixel         # Skip if y < 0 (t7 != 0)
    
    # Check if x < display width
    lw $t5, DISPLAY_WIDTH              # Load display width
    slt $t7, $a0, $t5                  # t7 = 1 if x < width, else 0
    beq $t7, $zero, skip_pixel         # Skip if x >= width (t7 == 0)
    
    # Check if y < display height
    lw $t5, DISPLAY_HEIGHT             # Load display height
    slt $t7, $a1, $t5                  # t7 = 1 if y < height, else 0
    beq $t7, $zero, skip_pixel         # Skip if y >= height (t7 == 0)

    # Draw pixel
    jal calc_position
    sw $t8, 0($v0)                     # Store pixel color

skip_pixel:
    addi $t4, $t4, 1                   # Move to next column
    j image_col_loop

next_image_row:
    addi $t3, $t3, 1                   # Move to next row
    j image_row_loop

image_done:
    # Restore registers and return
    lw $s2, 12($sp)
    lw $s1, 8($sp)
    lw $s0, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 16
    jr $ra
# ---- Function: Draw shark ----
draw_shark:
    addi $sp, $sp, -16
    sw $ra, 0($sp)
    sw $s0, 4($sp)
    sw $s1, 8($sp)
    sw $s2, 12($sp)

    lw $s0, shark_x          # Load shark's x
    lw $s1, shark_y          # Load shark's y
    lw $s2, shark_width      # Load shark width

    li $t3, 0               # Row counter
    lw $t4, shark_height     # shark height

shark_row_loop:
    # Check if row counter == height
    sub $t7, $t3, $t4
    beq $t7, $zero, shark_done

    li $t5, 0               # Column counter

    la $t6, shark_color_array
    mul $t7, $t3, $s2       # row * width
    sll $t7, $t7, 2         # byte offset
    add $t6, $t6, $t7       # row address

shark_col_loop:
    # Check if column counter == width
    sub $t7, $t5, $s2
    beq $t7, $zero, next_shark_row

    sll $t7, $t5, 2
    add $t8, $t6, $t7
    lw $t9, 0($t8)          # Load shark color
    
    # Skip if color is 0 (transparent)
    li $t7, 0
    beq $t9, $t7, skip_shark_pixel
    
    add $a0, $s0, $t5       # x = shark_x + column
    add $a1, $s1, $t3       # y = shark_y + row

    # Bounds check (x < 0)
    li $t7, 0
    slt $t8, $a0, $t7       # t8 = 1 if x < 0, else 0
    bne $t8, $zero, skip_shark_pixel
    
    # Bounds check (x >= DISPLAY_WIDTH)
    lw $t7, DISPLAY_WIDTH
    slt $t8, $a0, $t7       # t8 = 1 if x < width, else 0
    beq $t8, $zero, skip_shark_pixel
    
    # Bounds check (y < 0)
    li $t7, 0
    slt $t8, $a1, $t7       # t8 = 1 if y < 0, else 0
    bne $t8, $zero, skip_shark_pixel
    
    # Bounds check (y >= DISPLAY_HEIGHT)
    lw $t7, DISPLAY_HEIGHT
    slt $t8, $a1, $t7       # t8 = 1 if y < height, else 0
    beq $t8, $zero, skip_shark_pixel

    jal calc_position
    sw $t9, 0($v0)

skip_shark_pixel:
    addi $t5, $t5, 1
    j shark_col_loop

next_shark_row:
    addi $t3, $t3, 1
    j shark_row_loop

shark_done:
    lw $ra, 0($sp)
    lw $s0, 4($sp)
    lw $s1, 8($sp)
    lw $s2, 12($sp)
    addi $sp, $sp, 16
    jr $ra

# ---- Function: Move shark left ----
move_shark:
    # Save return address
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    # Store previous position for clearing
    lw $t0, shark_x
    sw $t0, shark_prev_x   # Save current position as previous

    # Move left
    addi $t0, $t0, -2       # Move left by 2 pixels
    sw $t0, shark_x

    # Clear previous shark position
    jal clear_shark_previous

    # Reset shark position if off-screen (t0 >= 0)
    li $t7, 0
    slt $t8, $t0, $t7       # t8 = 1 if t0 < 0, else 0
    beq $t8, $zero, no_reset
    
    # Reset x position
    li $t0, 256
    sw $t0, shark_x
    
    # Generate pseudo-random number
    lw $t1, rand_seed
    lw $t2, rand_mult
    mul $t3, $t1, $t2       # seed * multiplier
    lw $t4, rand_inc
    add $t3, $t3, $t4       # seed * multiplier + increment
    lw $t5, rand_mod
    div $t3, $t5            # (seed * multiplier + increment) % modulus
    mfhi $t3                # Get remainder
    sw $t3, rand_seed       # Store new seed
    
    # Scale to desired range
    lw $t4, shark_y_range
    mul $t3, $t3, $t4       # random * range
    div $t3, $t5            # (random * range) / modulus
    mflo $t3                # Get quotient
    lw $t4, shark_y_min
    add $t3, $t3, $t4       # random * range / modulus + min
    
    # Store new y position
    sw $t3, shark_y
    
no_reset:
    # Restore return address
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

# ---- New Function: Clear shark's previous position ----
clear_shark_previous:
    # Save return address and registers
    addi $sp, $sp, -12
    sw $ra, 0($sp)
    sw $s0, 4($sp)
    sw $s1, 8($sp)

    # Load shark's previous position
    lw $s0, shark_prev_x
    lw $s1, shark_y
    
    # Only clear if previous position is valid and different from current
    lw $t0, shark_x
    beq $s0, $t0, skip_clear  # Skip if positions are the same
    
    # Skip if previous position was off-screen (s0 < 0)
    li $t7, 0
    slt $t8, $s0, $t7        # t8 = 1 if s0 < 0, else 0
    bne $t8, $zero, skip_clear

    # Get shark dimensions
    lw $t2, shark_width
    lw $t3, shark_height

    # Draw sea pattern at previous shark position
    li $t4, 0            # Initialize y-counter

shark_clear_y_loop:
    # Check if y-counter >= shark_height
    slt $t7, $t4, $t3     # t7 = 1 if t4 < t3, else 0
    beq $t7, $zero, shark_clear_done
    
    li $t5, 0            # Initialize x-counter

shark_clear_x_loop:
    # Check if x-counter >= shark_width
    slt $t7, $t5, $t2     # t7 = 1 if t5 < t2, else 0
    beq $t7, $zero, shark_clear_next_y

    # Calculate pixel position
    add $a0, $s0, $t5    # x = shark_prev_x + x_counter
    add $a1, $s1, $t4    # y = shark_y + y_counter

    # Check if within screen bounds (x >= 0)
    li $t7, 0
    slt $t8, $a0, $t7     # t8 = 1 if a0 < 0, else 0
    bne $t8, $zero, shark_skip_pixel
    
    # Check if y >= 0
    slt $t8, $a1, $t7     # t8 = 1 if a1 < 0, else 0
    bne $t8, $zero, shark_skip_pixel
    
    # Check if x < DISPLAY_WIDTH
    lw $t6, DISPLAY_WIDTH
    slt $t8, $a0, $t6     # t8 = 1 if a0 < t6, else 0
    beq $t8, $zero, shark_skip_pixel
    
    # Check if y < DISPLAY_HEIGHT
    lw $t6, DISPLAY_HEIGHT
    slt $t8, $a1, $t6     # t8 = 1 if a1 < t6, else 0
    beq $t8, $zero, shark_skip_pixel

    # Get animation state for wave pattern
    lw $t9, animation_offset

    # Calculate pixel position in memory
    jal calc_position

    # Calculate wave pattern (same as in draw_sea_partial)
    add $a2, $a0, $a1      # x + y
    srl $a2, $a2, 3        # Divide by 8 for coarser pattern
    add $a2, $a2, $t9      # Add animation offset
    andi $a2, $a2, 0x3F    # Modulo 64

    # Simple horizontal pattern
    srl $a3, $a0, 2        # x / 4
    add $a3, $a3, $t9      # Add animation offset
    andi $a3, $a3, 0x3F    # Modulo 64

    # Pattern decision
    add $k0, $a2, $a3      # Combine patterns
    andi $k0, $k0, 0x3F    # Modulo 64
    li $t7, 32
    slt $k1, $k0, $t7      # k1 = 1 if k0 < 32, else 0

    # Load sea colors
    lw $t8, sea_light      # Light sea color
    lw $k0, sea_highlight  # Highlight sea color

    # Choose color based on pattern
    li $t7, 0
    beq $k1, $t7, use_light_shark  # If k1 == 0, use light color
    add $t8, $zero, $k0    # Use highlight color (replaces move)

use_light_shark:
    sw $t8, 0($v0)         # Store color at calculated address

shark_skip_pixel:
    addi $t5, $t5, 1
    j shark_clear_x_loop

shark_clear_next_y:
    addi $t4, $t4, 1
    j shark_clear_y_loop

shark_clear_done:
skip_clear:
    # Restore registers and return
    lw $s1, 8($sp)
    lw $s0, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 12
    jr $ra
# ---- Function: Check submarine-shark collision ----
check_collision:
    # Save return address
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    # Load positions and dimensions
    lw $t0, sub_x            # Submarine x
    lw $t1, sub_y            # Submarine y
    lw $t2, sub_length       # Submarine length
    lw $t3, sub_width        # Submarine width
    lw $t4, shark_x          # Shark x
    lw $t5, shark_y          # Shark y
    lw $t6, shark_width      # Shark width
    lw $t7, shark_height     # Shark height
    lw $t8, nb_lifes         # Current lives

    # Calculate submarine boundaries (using div by 2 instead of sra)
    li $s7, 2
    div $t2, $s7             # Half submarine length
    mflo $s0
    div $t3, $s7             # Half submarine width
    mflo $s1
    
    sub $a0, $t0, $s0        # Sub left
    add $a1, $t0, $s0        # Sub right
    sub $a2, $t1, $s1        # Sub top
    add $a3, $t1, $s1        # Sub bottom

    # Calculate shark boundaries (using add instead of move)
    add $s0, $t4, $zero      # Shark left
    add $s1, $t4, $t6        # Shark right
    add $s2, $t5, $zero      # Shark top
    add $s3, $t5, $t7        # Shark bottom

    # Check for collision (using slt instead of bge)
    slt $t9, $s1, $a0        # shark_right < sub_left
    bne $t9, $zero, no_collision
    
    slt $t9, $a1, $s0        # sub_right < shark_left
    bne $t9, $zero, no_collision
    
    slt $t9, $s3, $a2        # shark_bottom < sub_top
    bne $t9, $zero, no_collision
    
    slt $t9, $a3, $s2        # sub_bottom < shark_top
    bne $t9, $zero, no_collision

    # Collision occurred, decrement lives
    addi $t8, $t8, -1
    sw $t8, nb_lifes

    # Check if out of lives (using sub and bne instead of beqz)
    sub $t9, $t8, $zero
    bne $t9, $zero, still_alive
    j game_over
    
still_alive:
    # Set up for syscall 50 (ConfirmDialog)
    li $v0, 50                
    la $a0, collision_msg    
    syscall
    
    li $t9, 1
    sub $t0, $a0, $t9
    bne $t0, $zero, continue_game
    j Exit  # User clicked "No" (1), exit game
    
continue_game:
    # Reset shark position after collision
    li $t0, 256              
    sw $t0, shark_x

no_collision:
    # Restore return address
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

game_over:
    # Set up for syscall 50 (ConfirmDialog) for game over
    li $v0, 50
    la $a0, game_over_msg
    syscall
    
    # Check result (using slt and bne instead of beqz)
    slt $t9, $a0, $zero     # if $a0 < 0
    bne $t9, $zero, restart_game
    
    sub $t9, $a0, $zero     # if $a0 == 0
    bne $t9, $zero, Exit
    j restart_game          # User clicked "Yes" (0), restart

restart_game:
    # Reset lives
    li $t0, 3
    sw $t0, nb_lifes
    
    # Reset positions
    li $t0, 256
    sw $t0, shark_x
    
    # Return to main game loop
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

# ---- Function: Check keyboard for input ----
check_keyboard:
    lw $t3, sub_y                     
    sw $t3, prev_sub_y                

    # Save return address
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    # Get keyboard ready bit address
    lw $t0, KEYBOARD_ADDR
    addi $t0, $t0, -4                 

    # Check if a key is ready
    lw $t1, 0($t0)                    
    andi $t1, $t1, 1                  
    
    # Compare to zero (using sub and bne instead of beqz)
    sub $t9, $t1, $zero
    bne $t9, $zero, key_ready
    j check_done                      

key_ready:
    # Get keyboard data address
    lw $t0, KEYBOARD_ADDR

    # Read character from keyboard
    lw $t1, 0($t0)                    
    andi $t1, $t1, 0xFF               

    # Get submarine's current position
    lw $t2, sub_x                     
    lw $t3, sub_y                     
    lw $t5, DISPLAY_HEIGHT            
    lw $t7, sub_length                

    # Check for 'w' - move up
    li $t9, 'w'                       
    sub $t0, $t1, $t9
    bne $t0, $zero, not_up            
    
    li $t4, 0                         
    sw $t4, sub_direction             
    addi $t3, $t3, -10                
    
    slt $t0, $t3, $zero               # if $t3 < 0
    bne $t0, $zero, reset_position
    j update_position                 

not_up:
    # Check for 's' - move down
    li $t9, 's'                       
    sub $t0, $t1, $t9
    bne $t0, $zero, check_done        
    
    li $t4, 2                         
    sw $t4, sub_direction             
    addi $t3, $t3, 10                 
    add $t8, $t3, $t7                 
    
    slt $t0, $t5, $t8                 # if DISPLAY_HEIGHT < bottom edge
    bne $t0, $zero, reset_position
    j update_position                 

reset_position:
    # Reset position to previous valid position
    lw $t3, sub_y                     

update_position:
    # Update submarine's y-position
    sw $t3, sub_y                    

check_done:
    # Restore return address
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra                            
    
Exit: 
    li $v0, 10
    syscall