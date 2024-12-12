package triage.service;

import triage.model.Item;
import triage.repository.ItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ItemService {

    @Autowired
    private ItemRepository repository;

    public List<Item> getAllItems() {
        return repository.findAll();
    }

    public Optional<Item> getItemById(Long id) {
        return repository.findById(id);
    }

    public Item createItem(Item item) {
        return repository.save(item);
    }

    public Item updateItem(Long id, Item itemDetails) {
        return repository.findById(id).map(item -> {
            item.setName(itemDetails.getName());
            item.setDescription(itemDetails.getDescription());
            return repository.save(item);
        }).orElseThrow(() -> new RuntimeException("Item not found with id " + id));
    }

    public void deleteItem(Long id) {
        repository.deleteById(id);
    }
}
