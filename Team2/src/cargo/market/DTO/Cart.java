package cargo.market.DTO;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	private List<CartDTO> itemList = new ArrayList<CartDTO>();
	
	public List<CartDTO> getItemList(){
		return itemList;
	}
	
	// 물건삭제
	public void popList(String[] list){
		
		for(String id:list){
			System.out.println("삭제할물품 "+id);
			for(CartDTO dto: itemList){
				if(id.equals(dto.getItem())){
					System.out.println("dto "+dto.getItem());
					itemList.remove(dto);
					break;
				}
			}
		}
	}
	
	// 물건추가
	public void push(CartDTO cdto){
		
		boolean check = false;
		
		for(CartDTO dto: itemList){
			
			if(cdto.getItem().equals(dto.getItem())){
				System.out.println("기존수량 "+cdto.getQuantity());
				System.out.println("더할수량 "+dto.getQuantity());
				dto.setQuantity(cdto.getQuantity()+dto.getQuantity());
				check = true;
				break;
			}
		}
		
		if(check==false){
			itemList.add(cdto);
		}
	}
	
}
