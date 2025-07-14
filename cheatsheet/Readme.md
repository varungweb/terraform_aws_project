## crisp and easy-to-grasp Terraform Commands Cheat Sheet

---

### ✅ **Basic Commands**

| Purpose        | Command Example      |
| -------------- | -------------------- |
| Help           | `terraform -help`    |
| Version        | `terraform version`  |
| Format code    | `terraform fmt`      |
| Init directory | `terraform init`     |
| Validate code  | `terraform validate` |
| Plan changes   | `terraform plan`     |
| Apply changes  | `terraform apply`    |
| Destroy infra  | `terraform destroy`  |

---

### 🚀 **Enhancements & Options**

| Action               | Command                                   |
| -------------------- | ----------------------------------------- |
| Format recursively   | `terraform fmt --recursive`               |
| Init w/o plugins     | `terraform init -get-plugins=false`       |
| Apply auto-approve   | `terraform apply -auto-approve`           |
| Destroy auto-approve | `terraform destroy --auto-approve`        |
| Plan and save        | `terraform plan -out=tfplan`              |
| Apply saved plan     | `terraform apply tfplan`                  |
| Plan destroy         | `terraform plan -destroy`                 |
| Apply variable       | `terraform apply -var="env=dev"`          |
| Apply var file       | `terraform apply -var-file="vars.tfvars"` |
| Target resource      | `terraform apply -target=resource.name`   |

---

### 🧪 **Testing & Validation**

\| Test Expression              | `terraform console` (e.g., `1+2`, `join(...)`) |
\| Validate in JSON             | `terraform validate -json`                     |

---

### 📦 **Modules & Providers**

| Action         | Command                 |
| -------------- | ----------------------- |
| Get modules    | `terraform get`         |
| Update modules | `terraform get -update` |
| View providers | `terraform providers`   |

---

### 📁 **State File Management**

| Action                     | Command                                    |
| -------------------------- | ------------------------------------------ |
| View state                 | `terraform show`                           |
| List resources             | `terraform state list`                     |
| Move state resource        | `terraform state mv old new`               |
| Remove resource from state | `terraform state rm resource.name`         |
| Pull remote state          | `terraform state pull > state.tfstate`     |
| Push local state           | `terraform state push`                     |
| Show resource details      | `terraform state show resource.name`       |
| Replace provider           | `terraform state replace-provider old new` |

---

### 🔄 **State Sync & Refresh**

\| Refresh local state          | `terraform refresh`                            |

---

### 🔄 **Import Resources**

\| Import infra to state        | `terraform import res.name res_id`            |

---

### 🧹 **Resource Management**

\| Taint resource               | `terraform taint res.name`                    |
\| Untaint resource             | `terraform untaint res.name`                  |

---

### 🌍 **Workspaces**

\| Show current                | `terraform workspace show`                     |
\| List all                   | `terraform workspace list`                     |
\| New workspace              | `terraform workspace new dev`                  |
\| Select workspace           | `terraform workspace select dev`               |
\| Delete workspace           | `terraform workspace delete dev`               |

---

### 📤 **Outputs**

\| All outputs                 | `terraform output`                             |
\| Specific output            | `terraform output res_output`                  |
\| JSON output                | `terraform output -json`                       |

---

### 🔐 **Locks & Auth**

\| Force unlock                | `terraform force-unlock <lock_id>`            |
\| Login to Terraform Cloud    | `terraform login`                              |
\| Logout                      | `terraform logout`                             |

---

### 🧠 **Graphing**

\| Dependency graph            | `terraform graph`                              |
\| Graph from plan             | `terraform graph -plan=tfplan`                 |

---

### 📁 **Working Directory**

\| Run from another dir        | `terraform -chdir="../dir" apply`              |

---

### ⚙️ **Autocomplete**

\| Enable autocomplete         | `terraform -install-autocomplete`              |

---

### 📌 What is Terraform?

**Terraform** is an open-source **Infrastructure as Code (IaC)** tool to **provision, manage, and version cloud infrastructure** declaratively using HCL (HashiCorp Configuration Language).

---
