resource "aws_eip" "tfer--eipalloc-049eab8001b38c7ca" {
  network_border_group = "af-south-1"
  network_interface    = "eni-0bd90285447a44fde"
  public_ipv4_pool     = "amazon"

  tags = {
    Name = "ugdas_prod-eip-af-south-1b"
    name = "UGDAS Prod VPC"
  }

  tags_all = {
    Name = "ugdas_prod-eip-af-south-1b"
    name = "UGDAS Prod VPC"
  }

  vpc = "true"
}

resource "aws_eip" "tfer--eipalloc-0b6e48459e8b61d56" {
  network_border_group = "af-south-1"
  network_interface    = "eni-02f78dda5d9d5e00e"
  public_ipv4_pool     = "amazon"

  tags = {
    Name = "ugdas_prod-eip-af-south-1a"
    name = "UGDAS Prod VPC"
  }

  tags_all = {
    Name = "ugdas_prod-eip-af-south-1a"
    name = "UGDAS Prod VPC"
  }

  vpc = "true"
}
