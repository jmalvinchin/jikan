class EntriesService

    def compute_addon_cost(entry)
        total = 0
        entry.addons.each do |addon|
            total += (addon.item.price * addon.quantity)
        end

        total
    end

end