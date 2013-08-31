module MindBody
  module Models
    class ClientRelationship < Base
      attribute :related_client, Client
      attribute :relationship, Relationship
      attribute :relationship_name, String
      
    end
  end
end
    
