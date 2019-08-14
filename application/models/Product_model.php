<?php


class Product_model extends CI_Model
{
	public function list(): array
	{
		$this->db->select(<<<SQL
p.id, p.name, p.description, p.image, s.name as section,
JSON_ARRAYAGG(
	JSON_OBJECT(
		'type', pr.type,
		'value', pr.value
	)
) AS prices
SQL
		)
			->from('product p')
			->join('section s', 's.id = p.section_id')
			->join('price pr', 'pr.product_id = p.id')
			->group_by('p.id');
		return self::mapProduct($this->db->get()->result_array());
	}

	private static function mapProduct(array $products): array
	{
		return array_map(
			static function ($product) {
				$product['image'] = json_decode($product['image'], false);
				$product['prices'] = json_decode($product['prices'], false);
				return $product;
			}, $products
		);
	}
}
